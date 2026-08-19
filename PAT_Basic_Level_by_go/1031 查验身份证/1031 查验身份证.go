/*
题目：1031 查验身份证
实现原理：校验前 17 位数字并按权重求和；以余数查校验码表，再与最后一位比较。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// 查验身份证：按权重校验前 17 位，并核对校验码。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N := 0
	fmt.Sscanf(scanner.Text(), "%d", &N)
	weights := []int{7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2}
	check := "10X98765432"
	allPass := true
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		id := strings.TrimSpace(scanner.Text())
		sum := 0
		valid := true
		for j := 0; j < 17; j++ {
			if id[j] < '0' || id[j] > '9' {
				valid = false
				break
			}
			sum += int(id[j]-'0') * weights[j]
		}
		if valid && check[sum%11] != id[17] {
			valid = false
		}
		if !valid {
			allPass = false
			fmt.Println(id)
		}
	}
	if allPass {
		fmt.Println("All passed")
	}
}
