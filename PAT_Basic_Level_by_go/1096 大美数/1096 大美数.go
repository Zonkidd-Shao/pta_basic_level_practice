// 题目：1096 大美数
// 实现原理：判断正整数 N 是否为"大美数"——即存在 4 个不同的正因数，它们的和
// 能整除 N。先求出 N 的所有正因数，排序后四重循环枚举所有 4 元组合，检查
// 四数之和是否能被 N 整除。若能则输出 "Yes"，否则输出 "No"。

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
)

// divisors 返回正整数 n 的所有正因数。
func divisors(n int) []int {
	var d []int
	for i := 1; i <= n; i++ {
		if n%i == 0 {
			d = append(d, i)
		}
	}
	return d
}

// isGreat 判断 n 是否为大美数，即是否存在 4 个不同正因数，其和能整除 n。
func isGreat(n int) bool {
	d := divisors(n)
	if len(d) < 4 {
		return false
	}
	sort.Ints(d)
	// 枚举 4 个不同因数的组合
	for i := 0; i < len(d); i++ {
		for j := i + 1; j < len(d); j++ {
			for k := j + 1; k < len(d); k++ {
				for l := k + 1; l < len(d); l++ {
					s := d[i] + d[j] + d[k] + d[l]
					if n%s == 0 {
						return true
					}
				}
			}
		}
	}
	return false
}

// main 是程序入口，读取 K 个正整数，逐个判断是否为"大美数"并输出结果。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var k int
	fmt.Fscan(in, &k)
	for i := 0; i < k; i++ {
		var n int
		fmt.Fscan(in, &n)
		if isGreat(n) {
			fmt.Fprintln(out, "Yes")
		} else {
			fmt.Fprintln(out, "No")
		}
	}
}