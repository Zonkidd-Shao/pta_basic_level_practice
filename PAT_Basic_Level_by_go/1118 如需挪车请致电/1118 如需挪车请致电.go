/*
题目：1118 如需挪车请致电

解题思路：
解析 11 个表达式的值，每个表达式可能为：
  1. 拼音数字（如 "yi"→1）
  2. 简单算术表达式（如 "1+2"、"3*4"）
  3. 平方根运算（如 "sqrt25"→5）
将每个表达式的结果（0-9）直接输出为一个数字，共 11 位组成电话号码。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

// pinyin 拼音数字到整数的映射
var pinyin = map[string]int{
	"ling": 0, "yi": 1, "er": 2, "san": 3, "si": 4,
	"wu": 5, "liu": 6, "qi": 7, "ba": 8, "jiu": 9,
}

// compute 计算一个表达式字符串的值
func compute(s string) int {
	// 情况1：拼音数字
	if v, ok := pinyin[s]; ok {
		return v
	}

	// 情况2：平方根运算，如 "sqrt25"
	if len(s) >= 4 && s[:4] == "sqrt" {
		val := 0
		for _, c := range s[4:] {
			val = val*10 + int(c-'0')
		}
		// 找不超过 val 的最大整数平方根
		r := 0
		for i := 1; i*i <= val; i++ {
			if i*i == val {
				r = i
			}
		}
		return r
	}

	// 情况3：算术表达式 a op b
	opPos := -1
	op := byte(0)
	for i := 0; i < len(s); i++ {
		switch s[i] {
		case '+', '-', '*', '/', '%', '^':
			opPos = i
			op = s[i]
		}
	}

	// 解析左右操作数
	a, b := 0, 0
	for _, c := range s[:opPos] {
		a = a*10 + int(c-'0')
	}
	for _, c := range s[opPos+1:] {
		b = b*10 + int(c-'0')
	}

	// 执行运算
	switch op {
	case '+':
		return a + b
	case '-':
		return a - b
	case '*':
		return a * b
	case '/':
		return a / b
	case '%':
		return a % b
	case '^':
		r := 1
		for i := 0; i < b; i++ {
			r *= a
		}
		return r
	}
	return 0
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	// 读取 11 个表达式，计算每个结果并直接输出为数字字符
	for i := 0; i < 11; i++ {
		var s string
		fmt.Fscan(in, &s)
		out.WriteByte(byte('0' + compute(s)))
	}
	out.WriteByte('\n')
}