/*
 * 题目：1024 科学计数法
 * 实现原理：将科学计数法表示的数字（如 +1.23400E-03）转换为普通小数表示。
 * 解析出整数部分、小数部分和指数，根据指数的正负分别处理：
 * - 正指数：小数点右移，不足补零
 * - 负指数：小数点左移，前面补零
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// 将科学计数法字符串转换为普通小数表示。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	s := strings.TrimSpace(scanner.Text())
	neg := false
	if s[0] == '-' || s[0] == '+' {
		neg = s[0] == '-'
		s = s[1:] // 移除负号，后续统一处理
	}
	dot := strings.IndexByte(s, '.')
	ePos := strings.IndexByte(s, 'E')
	intPart := s[:dot]          // 整数部分
	fracPart := s[dot+1 : ePos] // 小数部分
	expStr := s[ePos+1:]        // 指数部分字符串
	exp, sign := 0, 1
	if expStr[0] == '+' {
		expStr = expStr[1:]
	} else if expStr[0] == '-' {
		sign = -1
		expStr = expStr[1:]
	}
	for _, c := range expStr {
		exp = exp*10 + int(c-'0') // 解析指数值
	}
	if sign > 0 {
		// 正指数：小数点右移
		digits := intPart + fracPart
		if exp >= len(fracPart) {
			b := digits + strings.Repeat("0", exp-len(fracPart))
			if neg {
				b = "-" + b
			}
			fmt.Println(b)
		} else {
			b := intPart + fracPart[:exp] + "." + fracPart[exp:]
			if neg {
				b = "-" + b
			}
			fmt.Println(b)
		}
	} else {
		// 负指数：小数点左移，前面补零
		var b string
		if exp == 0 {
			// 指数为 0 时数值不变，但正号不能出现在输出中。
			b = intPart + "." + fracPart
		} else {
			b = "0." + strings.Repeat("0", exp-1) + intPart + fracPart
		}
		if neg {
			b = "-" + b
		}
		fmt.Println(b)
	}
}
