// 题目：1017 A除以B
// 实现原理：大整数 A（不超过 1000 位）除以一位整数 B，使用竖式除法逐位计算。
// 从最高位开始，逐位取余数并乘以 10 加上下一位，除以 B 得到商的当前位，更新余数。
// 最终输出商和余数。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取大整数 A 和除数 B，输出商和余数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	A := f[0]
	B, _ := strconv.Atoi(f[1])
	quotient := ""
	rem := 0
	// 模拟竖式除法，从高位到低位逐位计算
	for i := 0; i < len(A); i++ {
		d := int(A[i] - '0')
		rem = rem*10 + d
		q := rem / B
		if q > 0 || quotient != "" {
			quotient += string(byte('0' + q))
		}
		rem %= B
	}
	// 如果商为空，说明 A < B，商为 0
	if quotient == "" {
		quotient = "0"
	}
	fmt.Printf("%s %d\n", quotient, rem)
}