/*
 * 题目：1062 最简分数
 * 解题思路：
 * 给定两个分数和一个分母 K，需要找出所有以 K 为分母且介于两给定分数之间
 * 的最简分数（即分子与分母互质）。将分数比较转化为乘法（a/b < p/K ⇔ a*K < p*b），
 * 避免浮点数运算，再通过 gcd 判断互质即可。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// gcd 使用辗转相除法求两个整数的最大公约数。
func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

// main 是程序入口函数，处理最简分数查找流程。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	// 解析第一个分数 a/b
	a, _ := strconv.Atoi(strings.Split(f[0], "/")[0])
	b, _ := strconv.Atoi(strings.Split(f[0], "/")[1])
	// 解析第二个分数 c/d
	c, _ := strconv.Atoi(strings.Split(f[1], "/")[0])
	d, _ := strconv.Atoi(strings.Split(f[1], "/")[1])
	// 解析目标分母 K
	K, _ := strconv.Atoi(f[2])

	res := make([]string, 0)
	// 枚举所有可能的分子 p（1 到 K-1）
	for p := 1; p < K; p++ {
		// 判断 a/b < p/K < c/d（转化为乘法避免浮点误差）
		if a*K < p*b && p*d < c*K {
			// 检查 p 与 K 是否互质
			if gcd(p, K) == 1 {
				res = append(res, fmt.Sprintf("%d/%d", p, K))
			}
		}
	}
	// 按分数值递增的顺序输出，空格分隔
	fmt.Println(strings.Join(res, " "))
}