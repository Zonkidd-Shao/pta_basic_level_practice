/*
 * 题目：1022 D 进制的 A+B
 * 实现原理：先计算 A+B 的和，然后用除 D 取余法将和转换为 D 进制数，
 * 注意处理和为 0 的特殊情况，最后按高位到低位输出。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 将 A+B 的结果转换为 D 进制输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	a, _ := strconv.Atoi(f[0])
	b, _ := strconv.Atoi(f[1])
	d, _ := strconv.Atoi(f[2])
	sum := a + b
	if sum == 0 {
		fmt.Println("0") // 和为零时直接输出 0
		return
	}
	var digits []int
	for sum > 0 {
		// 每次取余数并插入到切片头部，保证高位在前
		digits = append([]int{sum % d}, digits...)
		sum /= d
	}
	var b2 strings.Builder
	for _, x := range digits {
		b2.WriteString(strconv.Itoa(x))
	}
	fmt.Println(b2.String())
}