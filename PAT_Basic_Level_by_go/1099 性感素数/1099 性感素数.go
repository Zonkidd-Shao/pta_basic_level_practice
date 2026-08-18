// 题目：1099 性感素数
// 实现原理：性感素数是指相差 6 的一对素数。给定整数 N，先判断 N 是否为
// 性感素数（即 N 是素数且 N-6 或 N+6 也是素数）。若是则输出 "Yes" 和配对
// 的另一个素数（若两个方向都匹配，输出较小的 N-6）；否则输出 "No" 和大于 N
// 的最小性感素数。

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
	for i := 3; i*i <= n; i += 2 {
		if n%i == 0 {
			return false
		}
	}
	return true
}

// main 是程序入口，读取 N 并判断是否为性感素数，否则找下一个。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)

	// 判断 N 是否为性感素数
	if isPrime(n) && ((n-6 >= 2 && isPrime(n-6)) || isPrime(n+6)) {
		fmt.Fprintln(out, "Yes")
		// 配对的另一个性感素数，若不唯一输出较小的
		if n-6 >= 2 && isPrime(n-6) {
			fmt.Fprintln(out, n-6)
		} else {
			fmt.Fprintln(out, n+6)
		}
		return
	}
	fmt.Fprintln(out, "No")
	// 找到大于 N 的最小性感素数
	for m := n + 1; ; m++ {
		if isPrime(m) && ((m-6 >= 2 && isPrime(m-6)) || isPrime(m+6)) {
			fmt.Fprintln(out, m)
			return
		}
	}
}