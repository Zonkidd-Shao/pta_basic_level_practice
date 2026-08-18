// 题目：1016 部分A+B
// 实现原理：给定字符串 A 和数字 DA，从 A 中提取所有等于 DA 的数字位，按原顺序
// 组成整数 PA。同理得到 PB，输出 PA + PB。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// part 从字符串 a 中提取所有等于 da 的数字位，组成一个新整数。
// a：输入数字字符串
// da：要提取的目标数字（字符形式）
// 返回值：由所有等于 da 的位组成的整数
func part(a string, da byte) int {
	res := 0
	for i := 0; i < len(a); i++ {
		if a[i] == da {
			res = res*10 + int(da-'0')
		}
	}
	return res
}

// main 是程序入口函数，读取 A、DA、B、DB，计算并输出 PA + PB。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	a, da := f[0], f[1][0]
	b, db := f[2], f[3][0]
	fmt.Println(part(a, da) + part(b, db))
}