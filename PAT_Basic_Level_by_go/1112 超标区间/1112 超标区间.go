/*
题目：1112 超标区间

解题思路：
给定 N 个整数和一个阈值 T，找出所有连续子区间，其中每个元素都
大于 T。输出这些区间的起止下标（从 0 开始）。如果不存在这样的
区间，则输出所有整数中的最大值。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n, t int
	fmt.Fscan(in, &n, &t)

	// 读取所有整数，同时记录最大值
	vals := make([]int, n)
	maxVal := 0
	for i := 0; i < n; i++ {
		fmt.Fscan(in, &vals[i])
		if vals[i] > maxVal {
			maxVal = vals[i]
		}
	}

	// 遍历查找所有大于 T 的连续区间
	intervals := false
	i := 0
	for i < n {
		if vals[i] > t {
			j := i
			for j < n && vals[j] > t {
				j++
			}
			// 输出区间 [i, j-1]
			fmt.Fprintf(out, "[%d, %d]\n", i, j-1)
			intervals = true
			i = j
		} else {
			i++
		}
	}

	// 没有符合条件的区间，输出最大值
	if !intervals {
		fmt.Fprintln(out, maxVal)
	}
}