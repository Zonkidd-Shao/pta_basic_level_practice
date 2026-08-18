// 题目：1087 有多少不同的值
// 实现原理：给定自然数 N，计算 i = 1..N 时，⌊i/2⌋ + ⌊i/3⌋ + ⌊i/5⌋ 的值，
// 统计其中有多少个不同的值。使用哈希集合（map[int]bool）记录所有出现过的值，
// 最后输出集合大小。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取 N 并统计不同值的个数。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)
	seen := make(map[int]bool) // 用于记录已出现的值
	for i := 1; i <= n; i++ {
		seen[i/2+i/3+i/5] = true // 计算 ⌊i/2⌋ + ⌊i/3⌋ + ⌊i/5⌋ 并记录
	}
	fmt.Fprintln(out, len(seen)) // 输出不同值的个数
}