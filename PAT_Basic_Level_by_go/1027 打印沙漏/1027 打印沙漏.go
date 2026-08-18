/*
 * 题目：1027 打印沙漏
 * 实现原理：找到满足 2*k²-1 ≤ n 的最大 k，k 为沙漏上半层数。
 * 先输出从 k 到 1 的递减行（上三角），再输出从 2 到 k 的递增行（下三角），
 * 最后输出剩余未使用的符号数。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 用给定数量的 '*' 打印沙漏形状。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	n, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	k := 1
	// 找到满足 2*k²-1 ≤ n 的最大 k
	for 2*(k+1)*(k+1)-1 <= n {
		k++
	}
	used := 2*k*k - 1 // 沙漏实际使用的星号数
	// 上三角：从 k 到 1 行
	for i := k; i >= 1; i-- {
		fmt.Printf("%s%s\n", strings.Repeat(" ", k-i), strings.Repeat("*", 2*i-1))
	}
	// 下三角：从 2 到 k 行
	for i := 2; i <= k; i++ {
		fmt.Printf("%s%s\n", strings.Repeat(" ", k-i), strings.Repeat("*", 2*i-1))
	}
	fmt.Println(n - used) // 输出剩余未使用的符号数
}