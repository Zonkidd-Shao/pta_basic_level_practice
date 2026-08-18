// 题目：1097 矩阵行平移
// 实现原理：对一个 n×n 矩阵的奇数行（1-indexed）进行循环左移，平移量
// 按 1,2,...,k,1,2,... 循环。偶数行保持不变。平移时左侧移出的元素被丢弃，
// 右侧空出的位置用给定值 x 填充。最后输出各列的元素之和。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取矩阵和参数，执行行平移后输出各列之和。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n, k, x int
	fmt.Fscan(in, &n, &k, &x)
	mat := make([][]int, n)
	for i := 0; i < n; i++ {
		mat[i] = make([]int, n)
		for j := 0; j < n; j++ {
			fmt.Fscan(in, &mat[i][j])
		}
	}

	colSum := make([]int, n) // 各列元素之和
	for i := 0; i < n; i++ {
		row := mat[i]
		if i%2 == 0 { // 奇数行（1-indexed），即 0-indexed 偶数行
			// 平移量循环 1..k
			s := (i/2)%k + 1
			shifted := make([]int, n)
			for j := 0; j < n; j++ {
				if j < s {
					shifted[j] = x // 左侧空出的位置用 x 填充
				} else {
					shifted[j] = row[j-s] // 右侧元素左移
				}
			}
			row = shifted
		}
		// 累加当前行到各列之和
		for j := 0; j < n; j++ {
			colSum[j] += row[j]
		}
	}
	// 输出各列之和
	for j := 0; j < n; j++ {
		if j > 0 {
			out.WriteByte(' ')
		}
		fmt.Fprint(out, colSum[j])
	}
	out.WriteByte('\n')
}