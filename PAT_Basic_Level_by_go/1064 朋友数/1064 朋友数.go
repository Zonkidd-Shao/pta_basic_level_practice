/*
 * 题目：1064 朋友数
 * 解题思路：
 * 朋友数定义为一个整数的各位数字之和。使用哈希集合对每个输入的整数
 * 计算其各位数字之和并去重，最后升序排序输出集合大小及所有朋友数。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
)

// digitSum 计算整数 n 的各位数字之和。
func digitSum(n int) int {
	s := 0
	for n > 0 {
		s += n % 10 // 取末位累加
		n /= 10     // 去掉末位
	}
	return s
}

// main 是程序入口函数，统计并输出所有朋友数。
func main() {
	in := bufio.NewReader(os.Stdin)
	var n int
	if _, err := fmt.Fscan(in, &n); err != nil {
		return
	}
	// 使用集合去重存储所有出现过的朋友数
	set := make(map[int]bool)
	for i := 0; i < n; i++ {
		var v int
		fmt.Fscan(in, &v)
		set[digitSum(v)] = true
	}

	// 将集合转为切片并排序
	friends := make([]int, 0, len(set))
	for k := range set {
		friends = append(friends, k)
	}
	sort.Ints(friends)

	// 输出朋友数的个数
	fmt.Println(len(friends))
	// 输出升序排列的朋友数，空格分隔
	var b strings.Builder
	for i, v := range friends {
		if i > 0 {
			b.WriteByte(' ')
		}
		b.WriteString(fmt.Sprint(v))
	}
	fmt.Println(b.String())
}
