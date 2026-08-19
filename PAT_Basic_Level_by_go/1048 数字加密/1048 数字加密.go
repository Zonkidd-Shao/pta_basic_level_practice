/*
题目：1048 数字加密
实现原理：自个位起对齐两数，奇数位计算 (A+B)%13 并映射 J/Q/K，偶数位计算 B-A 后补 10。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// 数字加密：从个位起，奇数位 (A+B)%13，偶数位 (B-A) 加 10（为负时）。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	A := f[0]
	B := f[1]
	n := len(A)
	if len(B) > n {
		n = len(B)
	}
	res := make([]byte, n)
	for i := 0; i < n; i++ {
		pos := i + 1
		aDigit, bDigit := 0, 0
		if i < len(A) {
			aDigit = int(A[len(A)-1-i] - '0')
		}
		if i < len(B) {
			bDigit = int(B[len(B)-1-i] - '0')
		}
		if pos%2 == 1 {
			v := (aDigit + bDigit) % 13
			switch v {
			case 10:
				res[n-1-i] = 'J'
			case 11:
				res[n-1-i] = 'Q'
			case 12:
				res[n-1-i] = 'K'
			default:
				res[n-1-i] = byte('0' + v)
			}
		} else {
			v := bDigit - aDigit
			if v < 0 {
				v += 10
			}
			res[n-1-i] = byte('0' + v)
		}
	}
	fmt.Println(string(res))
}
