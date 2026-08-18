/*
题目：1124 最近的斐波那契数

解题思路：
给定正整数 n，找出与 n 距离最近的斐波那契数。
如果存在两个距离相等，取较小的那个。
先生成斐波那契数列直到超过 n，然后遍历所有生成的数，
找出与 n 差值最小的数（差值相等时取较小的数）。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)

	// 生成斐波那契数列直到超过 n
	fibs := []int{0, 1}
	for {
		next := fibs[len(fibs)-1] + fibs[len(fibs)-2]
		fibs = append(fibs, next)
		if next > n {
			break
		}
	}

	// 遍历所有斐波那契数，找出距离 n 最近的
	best := fibs[0]
	bestDiff := abs(n - best)
	for _, f := range fibs[1:] {
		diff := abs(n - f)
		// 距离更小，或距离相等但数值更小，则更新
		if diff < bestDiff || (diff == bestDiff && f < best) {
			bestDiff = diff
			best = f
		}
	}
	fmt.Fprintln(out, best)
}

// abs 返回整数 x 的绝对值
func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}