/*
题目：1104 天长地久

解题思路：
定义"天长地久数" A 满足：
  1. A 是 K 位数
  2. A 的各位数字之和为 m
  3. A+1 的各位数字之和为 n
  4. gcd(m, n) 是一个大于 2 的素数
每组测试用例需要输出所有满足条件的 (n, A) 对，按 n 升序、A 升序排列。
实现采用 DFS 深度优先搜索枚举各位数字，剪枝优化（剩余和不为负）。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
)

// sol 存储一组解，n 为 A+1 的各位数字之和，a 为 A 的值
type sol struct {
	n, a int
}

// digitSum 计算整数 n 的各位数字之和
func digitSum(n int) int {
	s := 0
	for n > 0 {
		s += n % 10
		n /= 10
	}
	return s
}

// gcd 计算两个整数的最大公约数（辗转相除法）
func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

// isPrime 判断 n 是否为素数
func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

// gen 通过 DFS 递归生成所有 K 位数中各位数字之和为 targetM 的数。
// remaining 是当前还需要凑出的位和，targetM 保存原始输入的 m。
// prefix: 当前已构造的前缀值，digitsSoFar: 已确定的位数
func gen(sols *[]sol, k, remaining, targetM, prefix, digitsSoFar int) {
	left := k - digitsSoFar
	if remaining < 0 || remaining > 9*left {
		return
	}
	if digitsSoFar == k {
		if remaining == 0 {
			// 已构造完一个 K 位数，检查条件
			a := prefix
			n := digitSum(a + 1)
			g := gcd(targetM, n)
			if g > 2 && isPrime(g) {
				*sols = append(*sols, sol{n, a})
			}
		}
		return
	}
	// 确定当前位的起始数字（首位不能为 0）
	start := 0
	if digitsSoFar == 0 {
		start = 1
	}
	for d := start; d <= 9; d++ {
		if remaining-d < 0 {
			continue // 剪枝：剩余和不够减
		}
		gen(sols, k, remaining-d, targetM, prefix*10+d, digitsSoFar+1)
	}
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var t int
	fmt.Fscan(in, &t)

	// 处理每组测试用例
	for c := 1; c <= t; c++ {
		var k, m int
		fmt.Fscan(in, &k, &m)
		var sols []sol
		gen(&sols, k, m, m, 0, 0)

		fmt.Fprintf(out, "Case %d\n", c)
		if len(sols) == 0 {
			fmt.Fprintln(out, "No Solution")
			continue
		}

		// 按 n 升序、A 升序排序后输出
		sort.Slice(sols, func(i, j int) bool {
			if sols[i].n != sols[j].n {
				return sols[i].n < sols[j].n
			}
			return sols[i].a < sols[j].a
		})
		for _, s := range sols {
			fmt.Fprintf(out, "%d %d\n", s.n, s.a)
		}
	}
}
