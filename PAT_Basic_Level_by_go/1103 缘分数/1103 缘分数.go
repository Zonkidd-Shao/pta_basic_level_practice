/*
题目：1103 缘分数

解题思路：
定义"缘分数"为满足以下条件的一对正整数 (a, b)：
  1. a^3 - (a-1)^3 = c^2，即 c 是完全平方数
  2. b^2 + (b-1)^2 = c
在区间 [m, n] 内枚举 a，对每个 a 计算 c^2 并判断是否为完全平方数，
再枚举 b 寻找满足 b^2 + (b-1)^2 = c 的解。
完全平方数判断采用二分查找法。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

// isSquare 判断 n 是否为完全平方数，若是则返回平方根
func isSquare(n int64) (int64, bool) {
	if n < 0 {
		return 0, false
	}
	// 二分查找平方根，限制上界避免溢出
	lo, hi := int64(0), n
	if hi > 1<<31 {
		hi = 1 << 31
	}
	for lo <= hi {
		mid := (lo + hi) / 2
		sq := mid * mid
		if sq == n {
			return mid, true
		}
		if sq < n {
			lo = mid + 1
		} else {
			hi = mid - 1
		}
	}
	return 0, false
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var m, n int
	fmt.Fscan(in, &m, &n)

	// 存储所有找到的缘分数对
	type pair struct{ a, b int }
	var res []pair

	// 枚举区间内的每个 a
	for a := m; a <= n; a++ {
		a64 := int64(a)
		// 计算 a^3 - (a-1)^3
		c2 := a64*a64*a64 - (a64-1)*(a64-1)*(a64-1)
		c, ok := isSquare(c2)
		if !ok {
			continue // c^2 不是完全平方数，跳过
		}

		// 找 b 使 b^2 + (b-1)^2 == c
		// 即 2b^2 - 2b + 1 = c
		for b := 1; ; b++ {
			v := b*b + (b-1)*(b-1)
			if v == int(c) {
				res = append(res, pair{a, b})
				break
			}
			if v > int(c) {
				break // 超出范围，不再继续
			}
		}
	}

	// 输出结果
	if len(res) == 0 {
		fmt.Fprintln(out, "No Solution")
		return
	}
	for _, p := range res {
		fmt.Fprintf(out, "%d %d\n", p.a, p.b)
	}
}