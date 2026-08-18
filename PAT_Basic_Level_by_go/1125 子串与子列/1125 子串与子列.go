/*
题目：1125 子串与子列

解题思路：
给定字符串 s 和模式串 p，求 s 中最短的子串，使得 p 是它的子序列
（即子串包含 p 的所有字符，且顺序一致）。
枚举 s 的每个起始位置，尝试匹配 p 的所有字符，记录匹配完成时在 s 中的
结束位置，取最短的区间（长度相同时取起始位置最靠前的）。
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

	var s, p string
	fmt.Fscan(in, &s, &p)

	// 枚举 s 的每个起始位置
	bestStart, bestLen := -1, 1<<30
	for i := 0; i < len(s); i++ {
		pos := 0     // 模式串 p 的当前匹配位置
		end := -1    // 匹配完成时在 s 中的结束位置
		for j := i; j < len(s) && pos < len(p); j++ {
			if s[j] == p[pos] {
				pos++
				end = j
			}
		}
		// 如果成功匹配了 p 的所有字符
		if pos == len(p) {
			l := end - i + 1
			// 取最短子串，长度相同时取起始位置更靠前的
			if l < bestLen || (l == bestLen && i < bestStart) {
				bestLen = l
				bestStart = i
			}
		}
	}

	// 输出最短子串
	fmt.Fprintln(out, s[bestStart:bestStart+bestLen])
}