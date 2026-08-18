/*
题目：1101 B是A的多少倍

解题思路：
给定一个正整数 A 和一个数字 D，将 A 的末 D 位数字移到前面，
得到一个新的数字 B，计算 B 除以 A 的值（保留两位小数）。
实现上，将 A 转为字符串，截取后 D 位和前几位拼接得到 B 的字符串，
再转为整数计算比值即可。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var a, d int
	fmt.Fscan(in, &a, &d)

	// 将整数 A 转为字符串，方便截取末尾 D 位
	s := strconv.Itoa(a)
	total := len(s)
	lastD := s[total-d:]   // 末尾 D 位
	first := s[:total-d]   // 前面的部分
	bStr := lastD + first  // 拼接得到 B 的字符串

	// 将 B 的字符串转为整数，计算比值并输出
	b, _ := strconv.Atoi(bStr)
	ratio := float64(b) / float64(a)
	fmt.Fprintf(out, "%.2f\n", ratio)
}