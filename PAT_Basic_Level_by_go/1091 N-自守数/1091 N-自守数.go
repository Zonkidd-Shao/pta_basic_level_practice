// 题目：1091 N-自守数
// 实现原理：对每个给定的 K（1<=K<10^4），枚举 N=1..9，检查 N*K² 的末尾数字
// 是否与 K 相同（即 N*K² % 10^len(K) == K）。通过将数字转为字符串，比较末尾
// 子串来实现。若存在这样的 N，则输出 N 和 N*K²；否则输出 "No"。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

// main 是程序入口，读取 M 个 K，逐个检查是否为 N-自守数并输出结果。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var m int
	fmt.Fscan(in, &m)
	for i := 0; i < m; i++ {
		var k int
		fmt.Fscan(in, &k)
		ksq := k * k               // 计算 K²
		ks := strconv.Itoa(k)      // K 的字符串形式
		L := len(ks)               // K 的位数
		found := false
		// 枚举 N = 1..9
		for nn := 1; nn < 10; nn++ {
			prod := nn * ksq
			ps := strconv.Itoa(prod)
			if len(ps) < L {
				continue
			}
			// 比较末尾 L 位是否等于 K
			if ps[len(ps)-L:] == ks {
				fmt.Fprintf(out, "%d %d\n", nn, prod)
				found = true
				break
			}
		}
		if !found {
			fmt.Fprintln(out, "No")
		}
	}
}