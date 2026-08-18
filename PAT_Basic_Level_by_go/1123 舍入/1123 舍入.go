/*
题目：1123 舍入

解题思路：
实现三种舍入模式，将数字舍入到指定小数位数 d：
  1. 四舍五入：看第 d+1 位，≥5 则进位
  2. 截断：直接丢弃多余小数位
  3. 四舍六入五成双（银行家舍入）：第 d+1 位 <5 舍，>5 入，
     等于 5 时看后面是否有非零数字，有则入，否则看第 d 位奇偶性，
     奇进偶舍。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// addOne 对十进制数字符串加 1
func addOne(s string) string {
	b := []byte(s)
	carry := 1
	for i := len(b) - 1; i >= 0 && carry > 0; i-- {
		v := int(b[i]-'0') + carry
		if v == 10 {
			b[i] = '0'
			carry = 1
		} else {
			b[i] = byte('0' + v)
			carry = 0
		}
	}
	if carry > 0 {
		return "1" + string(b)
	}
	return string(b)
}

// padRight 在字符串右侧补 '0' 到长度 n
func padRight(s string, n int) string {
	for len(s) < n {
		s += "0"
	}
	return s
}

// padLeft 在字符串左侧补 '0' 到长度 n
func padLeft(s string, n int) string {
	for len(s) < n {
		s = "0" + s
	}
	return s
}

// roundNumber 将数字 s 舍入到 d 位小数
// mode: 1=四舍五入, 2=截断, 3=四舍六入五成双
func roundNumber(s string, d, mode int) string {
	// 处理符号
	sign := ""
	if len(s) > 0 && s[0] == '-' {
		sign = "-"
		s = s[1:]
	}

	// 分离整数部分和小数部分
	intPart := s
	fracPart := ""
	if idx := strings.IndexByte(s, '.'); idx >= 0 {
		intPart = s[:idx]
		fracPart = s[idx+1:]
	}

	// 补齐小数部分到至少 d+1 位，以便判断取舍
	fracPart = padRight(fracPart, d+1)

	// 判断是否需要进位
	roundUp := false
	if mode != 2 { // 模式 2 为截断，不进位
		dig := fracPart[d] // 第 d+1 位（0-indexed）
		if mode == 1 {
			// 四舍五入：≥5 进位
			roundUp = dig >= '5'
		} else { // mode 3：四舍六入五成双
			if dig < '5' {
				roundUp = false
			} else if dig > '5' {
				roundUp = true
			} else {
				// 等于 5，检查后面是否有非零数字
				hasNonZero := false
				for j := d + 1; j < len(fracPart); j++ {
					if fracPart[j] != '0' {
						hasNonZero = true
						break
					}
				}
				if hasNonZero {
					roundUp = true
				} else {
					// 看保留的最后一位的奇偶性
					var lastKept byte
					if d > 0 {
						lastKept = fracPart[d-1]
					} else {
						lastKept = intPart[len(intPart)-1]
					}
					roundUp = (lastKept-'0')%2 == 1 // 奇进偶舍
				}
			}
		}
	}

	// 保留 d 位小数部分
	kept := fracPart[:d]
	core := intPart + kept

	// 如果需要进位，对 core 加 1
	if roundUp {
		core = addOne(core)
	}

	// 组装结果
	var result string
	if d == 0 {
		result = core
	} else {
		if len(core) <= d {
			// 整数部分为 0 的情况
			result = "0." + padLeft(core, d)
		} else {
			intRes := core[:len(core)-d]
			fracRes := core[len(core)-d:]
			result = intRes + "." + fracRes
		}
	}

	// 负数处理：结果为 0 时不加负号
	if sign == "-" && result != "0" && result != "0."+strings.Repeat("0", d) {
		result = "-" + result
	}
	return result
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n, d int
	fmt.Fscan(in, &n, &d)

	// 处理每组测试用例
	for i := 0; i < n; i++ {
		var mode int
		var num string
		fmt.Fscan(in, &mode, &num)
		fmt.Fprintln(out, roundNumber(num, d, mode))
	}
}