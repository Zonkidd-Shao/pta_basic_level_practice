/*
题目：1113 钱串子的加法

解题思路：
两个 30 进制数的加法运算。30 进制使用 0-9 表示 0-9，a-t 表示 10-29。
实现大数加法：将两个数字符串反转后从低位开始逐位相加并处理进位，
最后反转回来并去掉前导零。基数为 30。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

const base = 30 // 30 进制

// charToVal 将字符转换为对应的数值（0-9 → 0-9，a-t → 10-29）
func charToVal(c byte) int {
	if c >= '0' && c <= '9' {
		return int(c - '0')
	}
	return int(c-'a') + 10
}

// valToChar 将数值（0-29）转换为对应的字符
func valToChar(v int) byte {
	if v < 10 {
		return byte('0' + v)
	}
	return byte('a' + v - 10)
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var a, b string
	fmt.Fscan(in, &a, &b)

	// 反转字符串以便从低位开始相加
	revA := reverseStr(a)
	revB := reverseStr(b)

	// 逐位相加，处理进位
	carry := 0
	var res []byte
	for i := 0; i < len(revA) || i < len(revB) || carry > 0; i++ {
		va, vb := 0, 0
		if i < len(revA) {
			va = charToVal(revA[i])
		}
		if i < len(revB) {
			vb = charToVal(revB[i])
		}
		sum := va + vb + carry
		carry = sum / base
		res = append(res, valToChar(sum%base))
	}

	// 此时 res 为小端序，反转得到大端序表示
	for i, j := 0, len(res)-1; i < j; i, j = i+1, j-1 {
		res[i], res[j] = res[j], res[i]
	}

	// 去掉前导零，但至少保留一位
	s := string(res)
	i := 0
	for i < len(s)-1 && s[i] == '0' {
		i++
	}
	fmt.Fprintln(out, s[i:])
}

// reverseStr 返回字符串 s 的反转
func reverseStr(s string) string {
	b := []byte(s)
	for i, j := 0, len(b)-1; i < j; i, j = i+1, j-1 {
		b[i], b[j] = b[j], b[i]
	}
	return string(b)
}