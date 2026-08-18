// 题目：1013 数素数
// 实现原理：输出第 M 到第 N 个素数（M、N 为正整数且 M <= N）。
// 从 2 开始遍历自然数，每找到一个素数就计数，当计数达到 M 时开始记录，
// 直到计数达到 N 为止。每 10 个素数一行输出。

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

// main 是程序入口函数，读取 M 和 N，输出第 M 到第 N 个素数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	m, _ := strconv.Atoi(f[0])
	n, _ := strconv.Atoi(f[1])

	count := 0
	num := 2
	out := make([]string, 0)
	// 遍历自然数，直到找到第 N 个素数
	for count < n {
		if isPrime(num) {
			count++
			// 从第 M 个开始记录
			if count >= m {
				out = append(out, strconv.Itoa(num))
			}
		}
		num++
	}
	// 每 10 个一行输出
	var b strings.Builder
	for i, v := range out {
		if i > 0 {
			if i%10 == 0 {
				b.WriteByte('\n')
			} else {
				b.WriteByte(' ')
			}
		}
		b.WriteString(v)
	}
	fmt.Print(b.String())
}