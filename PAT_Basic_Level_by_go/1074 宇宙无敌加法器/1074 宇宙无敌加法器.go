/*
 * 题目：1074 宇宙无敌加法器
 * 解题思路：
 * 给定一个进制表字符串，每一位上的数字是十进制，但不同位的进制可能
 * 不同（由进制表对应位指定，0 表示十进制）。将两个数按位从低到高逐位
 * 相加，处理进位，最后去掉前导零输出。注意两个数的位数可能少于进制表
 * 长度，需在前面补 0 对齐。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// main 是程序入口函数，实现自定义进制加法。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	// 读取进制表：每一位为十进制数，表示该位的进制（0 表示 10 进制）
	table := strings.TrimSpace(scanner.Text())
	scanner.Scan()
	A := strings.TrimSpace(scanner.Text()) // 第一个数
	scanner.Scan()
	B := strings.TrimSpace(scanner.Text()) // 第二个数

	n := len(table)
	// 将两个数左补 0 至与进制表等长，方便按位运算
	for len(A) < n {
		A = "0" + A
	}
	for len(B) < n {
		B = "0" + B
	}

	res := make([]byte, n)
	carry := 0
	// 从低位（最右）到高位逐位相加
	for i := n - 1; i >= 0; i-- {
		base := int(table[i] - '0')
		if base == 0 {
			base = 10 // 0 表示十进制
		}
		x := int(A[i] - '0')
		y := int(B[i] - '0')
		s := x + y + carry
		res[i] = byte('0' + s%base) // 当前位结果
		carry = s / base             // 进位
	}

	// 若最高位仍有进位，在前面追加
	if carry > 0 {
		res = append([]byte{byte('0' + carry)}, res...)
	}

	// 去掉前导零
	out := strings.TrimLeft(string(res), "0")
	if out == "" {
		out = "0" // 若结果全零则输出单个 0
	}
	fmt.Println(out)
}