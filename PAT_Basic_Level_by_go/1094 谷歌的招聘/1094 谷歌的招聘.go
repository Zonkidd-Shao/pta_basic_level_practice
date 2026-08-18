// 题目：1094 谷歌的招聘
// 实现原理：给定一个长度为 L 的数字字符串，找出其中最早出现的连续 K 位
// 子串，使其表示的数为素数。从前往后滑动窗口，将子串转为整数并判断是否为
// 素数。若找到则输出该子串，否则输出 "404"。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// isPrime 判断整数 n 是否为素数。
func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	if n%2 == 0 {
		return n == 2
	}
	// 只检查奇数因子
	for i := 3; i*i <= n; i += 2 {
		if n%i == 0 {
			return false
		}
	}
	return true
}

// main 是程序入口，读取长数字串并查找最早的 K 位素数子串。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var l, k int
	fmt.Fscan(in, &l, &k)
	var num string
	fmt.Fscan(in, &num)

	// 滑动窗口遍历所有 K 位子串
	for i := 0; i+k <= len(num); i++ {
		sub := num[i : i+k]
		// 将子串转为整数（k<=9，int 足够）
		n := 0
		for _, c := range sub {
			n = n*10 + int(c-'0')
		}
		if isPrime(n) {
			fmt.Fprintln(out, sub)
			return
		}
	}
	fmt.Fprintln(out, "404")
}