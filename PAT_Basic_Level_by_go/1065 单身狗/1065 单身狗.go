/*
 * 题目：1065 单身狗
 * 解题思路：
 * 先建立夫妻/伴侣的配对映射表（双向存储）；读取所有参加派对的人的编号，
 * 对每个人检查其伴侣是否也在场（通过哈希集合快速判断），若没有伴侣或
 * 伴侣不在场，则为"单身狗"。最后将结果升序排序并输出。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

// main 是程序入口函数，统计派对中的"单身狗"。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	// 读取夫妻对数 N
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	partner := make(map[int]int) // 存储配对关系（双向）
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		a, _ := strconv.Atoi(f[0])
		b, _ := strconv.Atoi(f[1])
		partner[a] = b // a 的伴侣是 b
		partner[b] = a // b 的伴侣是 a
	}

	// 读取总人数 M
	scanner.Scan()
	parts := strings.Fields(scanner.Text())
	M, _ := strconv.Atoi(parts[0])

	// 读取所有参加者编号
	ids := make([]int, 0, M)
	for _, s := range parts[1:] {
		v, _ := strconv.Atoi(s)
		ids = append(ids, v)
	}
	// 如果一行不够，继续读取后续行
	for len(ids) < M {
		if !scanner.Scan() {
			break
		}
		for _, s := range strings.Fields(scanner.Text()) {
			v, _ := strconv.Atoi(s)
			ids = append(ids, v)
		}
	}

	// 将参加者编号存入集合以便快速查找
	present := make(map[int]bool)
	for _, id := range ids {
		present[id] = true
	}

	// 筛选出"单身狗"：没有伴侣或伴侣不在场
	single := make([]int, 0)
	for _, id := range ids {
		p, ok := partner[id]
		if !ok || !present[p] {
			single = append(single, id)
		}
	}

	// 升序排序并输出
	sort.Ints(single)
	fmt.Println(len(single))
	var b strings.Builder
	for i, v := range single {
		if i > 0 {
			b.WriteByte(' ')
		}
		b.WriteString(fmt.Sprintf("%05d", v)) // 按五位编号格式输出
	}
	fmt.Println(b.String())
}