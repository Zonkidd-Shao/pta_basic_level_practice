/*
题目：1038 统计同成绩学生
实现原理：成绩范围为 0~100，以成绩为下标计数；每次查询可直接 O(1) 取频次。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
)

// 统计同成绩学生：对每个查询的分数输出出现次数。
func main() {
	in := bufio.NewReader(os.Stdin)
	var n int
	if _, err := fmt.Fscan(in, &n); err != nil {
		return
	}
	cnt := make([]int, 101)
	for i := 0; i < n; i++ {
		var v int
		fmt.Fscan(in, &v)
		cnt[v]++
	}
	var m int
	fmt.Fscan(in, &m)
	for i := 0; i < m; i++ {
		var v int
		fmt.Fscan(in, &v)
		if i > 0 {
			fmt.Print(" ")
		}
		fmt.Print(cnt[v])
	}
	fmt.Println()
}
