/*
题目：1114 全素日

解题思路：
给定一个日期字符串（如 "20200101"），从完整字符串开始，每次去掉
第一个字符，检查所有后缀子串对应的整数是否都是素数。
若是，则输出 "All Prime!"；否则逐行输出每个后缀子串及其素数判断结果。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

// isPrime 判断整数 n 是否为素数
func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	if n%2 == 0 {
		return n == 2
	}
	// 只检查奇数因子，优化性能
	for i := 3; i*i <= n; i += 2 {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var date string
	fmt.Fscan(in, &date)

	// 检查所有后缀子串是否为素数
	allPrime := true
	for i := 0; i < len(date); i++ {
		sub := date[i:]               // 从位置 i 到末尾的后缀
		v, _ := strconv.Atoi(sub)     // 转为整数
		if isPrime(v) {
			fmt.Fprintf(out, "%s Yes\n", sub)
		} else {
			fmt.Fprintf(out, "%s No\n", sub)
			allPrime = false
		}
	}
	if allPrime {
		fmt.Fprintln(out, "All Prime!")
	}
}