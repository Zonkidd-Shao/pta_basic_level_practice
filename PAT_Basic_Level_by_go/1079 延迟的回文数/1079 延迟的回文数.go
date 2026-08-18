/*
 * 题目：1079 延迟的回文数
 * 解题思路：
 * 给定一个正整数 A，将其逆转得 B，计算 A + B 的和 C。
 * 若 C 是回文数则输出，否则用 C 替换 A 继续上述过程，
 * 最多迭代 10 步。若 10 步内未出现回文数则输出失败信息。
 * 涉及大数加法，用字符串处理。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// reverse 返回字符串 s 的逆序字符串。
func reverse(s string) string {
	b := []byte(s)
	for i, j := 0, len(b)-1; i < j; i, j = i+1, j-1 {
		b[i], b[j] = b[j], b[i]
	}
	return string(b)
}

// isPalindrome 判断字符串 s 是否为回文（正反相同）。
func isPalindrome(s string) bool {
	for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
		if s[i] != s[j] {
			return false
		}
	}
	return true
}

// addBig 实现两个长度相同的数字字符串的大数加法，返回结果字符串。
func addBig(a, b string) string {
	n := len(a)
	res := make([]byte, n)
	carry := 0
	// 从最低位开始逐位相加
	for i := n - 1; i >= 0; i-- {
		x := int(a[i] - '0')
		y := int(b[i] - '0')
		s := x + y + carry
		res[i] = byte('0' + s%10)
		carry = s / 10
	}
	// 最高位有进位则追加
	if carry > 0 {
		res = append([]byte{byte('0' + carry)}, res...)
	}
	// 去掉前导零
	out := strings.TrimLeft(string(res), "0")
	if out == "" {
		out = "0"
	}
	return out
}

// main 是程序入口函数，执行回文数迭代流程。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	A := strings.TrimSpace(scanner.Text())
	// 若初始就是回文数，直接输出
	if isPalindrome(A) {
		fmt.Printf("%s is a palindromic number.\n", A)
		return
	}
	// 最多迭代 10 步
	for i := 0; i < 10; i++ {
		B := reverse(A)
		C := addBig(A, B)
		fmt.Printf("%s + %s = %s\n", A, B, C)
		if isPalindrome(C) {
			fmt.Printf("%s is a palindromic number.\n", C)
			return
		}
		A = C // 继续下一步迭代
	}
	fmt.Println("Not found in 10 iterations.")
}