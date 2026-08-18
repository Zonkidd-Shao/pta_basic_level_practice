// 题目：1007 素数对猜想
// 实现原理：统计不超过 N 的相邻素数对（差为 2）的个数。从 3 开始遍历到 N，
// 先判断当前数是否为素数，若是则检查与前一个素数的差是否为 2。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// isPrime 判断 n 是否为素数。
// 返回值：true 表示是素数，false 表示不是素数。
func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	// 只需检查到 sqrt(n) 即可
	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

// main 是程序入口函数，读取 N 并输出相邻素数对的个数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	n, err := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	if err != nil {
		return
	}
	cnt := 0
	prev := 2 // 前一个素数
	for i := 3; i <= n; i++ {
		if isPrime(i) {
			// 差为 2 即为一对素数对
			if i-prev == 2 {
				cnt++
			}
			prev = i
		}
	}
	fmt.Println(cnt)
}