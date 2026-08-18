// 题目：1093 字符串 A+B
// 实现原理：给定两个字符串 A 和 B，按 A 在前 B 在后的顺序输出所有字符，
// 但每个字符只输出一次（即去重）。使用哈希集合记录已输出的字符，遍历
// A+B 拼接后的字符串，遇到未出现过的字符时输出并标记。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取两行字符串，去重合并后输出。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	a, _ := in.ReadString('\n')
	b, _ := in.ReadString('\n')
	// 去除行尾换行符
	trim := func(s string) string {
		for len(s) > 0 && (s[len(s)-1] == '\n' || s[len(s)-1] == '\r') {
			s = s[:len(s)-1]
		}
		return s
	}
	a = trim(a)
	b = trim(b)

	seen := make(map[rune]bool) // 记录已输出的字符
	var sb []rune
	// 按序合并 A 和 B，去重
	for _, ch := range a + b {
		if !seen[ch] {
			seen[ch] = true
			sb = append(sb, ch)
		}
	}
	fmt.Fprintln(out, string(sb))
}