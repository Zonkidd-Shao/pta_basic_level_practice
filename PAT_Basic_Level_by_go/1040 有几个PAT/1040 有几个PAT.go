/*
题目：1040 有几个PAT
实现原理：从左到右累积 P、PA 和 PAT 子序列数；遇到 A 或 T 时用已有子序列扩展。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// 有几个PAT：统计字符串中 "PAT" 子序列的个数（模 1e9+7）。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	s := strings.TrimSpace(scanner.Text())
	const mod = 1000000007
	countP, countPA, countPAT := 0, 0, 0
	for _, c := range s {
		switch c {
		case 'P':
			countP++
		case 'A':
			countPA = (countPA + countP) % mod
		case 'T':
			countPAT = (countPAT + countPA) % mod
		}
	}
	fmt.Println(countPAT)
}
