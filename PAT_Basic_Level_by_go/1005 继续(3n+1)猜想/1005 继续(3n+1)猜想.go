// 题目：1005 继续(3n+1)猜想
// 实现原理：给定一组正整数，对每个数进行卡拉兹递推，记录被覆盖的数（即递推过程中
// 出现在其他数递推序列中的数）。未被覆盖的数即为"关键数字"，按从大到小输出。

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取一组数，找出关键数字并按从大到小输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	if !scanner.Scan() {
		return
	}
	fields := strings.Fields(scanner.Text())
	nums := make([]int, 0, len(fields))
	// inSet 记录输入中出现的所有数字
	inSet := make(map[int]bool)
	for _, f := range fields {
		v, _ := strconv.Atoi(f)
		nums = append(nums, v)
		inSet[v] = true
	}

	// covered 记录被其他数字递推过程覆盖的数
	covered := make(map[int]bool)
	for _, n := range nums {
		x := n
		// 模拟卡拉兹递推过程
		for x != 1 {
			if x%2 == 0 {
				x /= 2
			} else {
				x = (3*x + 1) / 2
			}
			// 如果 x 在输入集合中，则标记为被覆盖
			if inSet[x] {
				covered[x] = true
			}
		}
	}

	// 收集未被覆盖的关键数字
	keys := make([]int, 0, len(nums))
	for _, n := range nums {
		if !covered[n] {
			keys = append(keys, n)
		}
	}
	// 按从大到小排序
	sort.Sort(sort.Reverse(sort.IntSlice(keys)))

	// 输出结果，空格分隔
	var b strings.Builder
	for i, k := range keys {
		if i > 0 {
			b.WriteByte(' ')
		}
		b.WriteString(strconv.Itoa(k))
	}
	fmt.Println(b.String())
}