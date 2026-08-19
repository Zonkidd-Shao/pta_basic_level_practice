/*
题目：1057 数零壹
实现原理：累加英文字母序号，再不断右移该和的二进制表示，分别统计最低位为 0 和 1 的次数。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
)

// 数零壹：字母序号求和，统计其二进制表示中 0 与 1 的个数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	line := scanner.Text()
	sum := 0
	for _, ch := range line {
		switch {
		case ch >= 'a' && ch <= 'z':
			sum += int(ch-'a') + 1
		case ch >= 'A' && ch <= 'Z':
			sum += int(ch-'A') + 1
		}
	}
	if sum == 0 {
		fmt.Println("0 0")
		return
	}
	zeros, ones := 0, 0
	for sum > 0 {
		if sum&1 == 1 {
			ones++
		} else {
			zeros++
		}
		sum >>= 1
	}
	fmt.Printf("%d %d\n", zeros, ones)
}
