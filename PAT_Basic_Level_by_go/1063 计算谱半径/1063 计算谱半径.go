/*
 * 题目：1063 计算谱半径
 * 解题思路：
 * 谱半径定义为复数模长的最大值。对于每个输入的实部与虚部，
 * 计算 sqrt(实部² + 虚部²) 并更新最大值，最后保留两位小数输出。
 */
package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，计算并输出谱半径（最大模长）。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	// 读取复数个数 N
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	maxR := 0.0 // 记录最大模长
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		r, _ := strconv.ParseFloat(f[0], 64)  // 实部
		im, _ := strconv.ParseFloat(f[1], 64) // 虚部
		// 计算复数模长并更新最大值
		rho := math.Sqrt(r*r + im*im)
		if rho > maxR {
			maxR = rho
		}
	}
	// 保留两位小数输出谱半径
	fmt.Printf("%.2f\n", maxR)
}