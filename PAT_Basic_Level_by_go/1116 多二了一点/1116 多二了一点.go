/*
题目：1116 多二了一点

解题思路：
给定一个可能很长的数字字符串，如果其长度为偶数，则将其分成前后两半
（前半为 y，后半为 x），判断 x - y 是否等于 2。
如果是则输出 "Yes: x - y = 2"，否则输出 "No: x - y != 2"。
若长度为奇数，输出 "Error: 总位数 digit(s)"。
使用 math/big 处理大整数运算。
*/

package main

import (
	"bufio"
	"fmt"
	"math/big"
	"os"
)

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	// 读取数字字符串（可能包含换行符）
	s, _ := in.ReadString('\n')
	for len(s) > 0 && (s[len(s)-1] == '\n' || s[len(s)-1] == '\r') {
		s = s[:len(s)-1]
	}

	L := len(s)
	// 奇数位数字符串不合法
	if L%2 != 0 {
		fmt.Fprintf(out, "Error: %d digit(s)\n", L)
		return
	}

	// 分割为前后两半
	half := L / 2
	y := s[:half] // 前半部分
	x := s[half:] // 后半部分

	// 使用大整数计算差值
	yv, _ := new(big.Int).SetString(y, 10)
	xv, _ := new(big.Int).SetString(x, 10)
	diff := new(big.Int).Sub(xv, yv)

	if diff.Cmp(big.NewInt(2)) == 0 {
		fmt.Fprintf(out, "Yes: %s - %s = 2\n", x, y)
	} else {
		fmt.Fprintf(out, "No: %s - %s != 2\n", x, y)
	}
}