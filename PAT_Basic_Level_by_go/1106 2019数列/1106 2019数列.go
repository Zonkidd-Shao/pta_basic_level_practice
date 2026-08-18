/*
题目：1106 2019数列

解题思路：
定义"2019数列"：前 4 项固定为 2, 0, 1, 9，从第 5 项开始，
每一项等于前 4 项之和的个位数。即递推公式：
  a[n] = (a[n-1] + a[n-2] + a[n-3] + a[n-4]) % 10
输出前 n 项（无空格分隔）。
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

	var n int
	fmt.Fscan(in, &n)

	// 初始化数列的前 4 项
	seq := []int{2, 0, 1, 9}

	// 按递推公式生成后续项，直到达到 n 项
	for len(seq) < n {
		s := seq[len(seq)-1] + seq[len(seq)-2] + seq[len(seq)-3] + seq[len(seq)-4]
		seq = append(seq, s%10) // 取个位数
	}

	// 输出前 n 项
	for _, v := range seq[:n] {
		fmt.Fprint(out, v)
	}
	out.WriteByte('\n')
}