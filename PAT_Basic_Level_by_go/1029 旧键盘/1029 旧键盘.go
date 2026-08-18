/*
 * 题目：1029 旧键盘
 * 实现原理：将实际输入字符串中出现的字符标记为"未坏"，然后遍历期望字符串，
 * 找出在"未坏"集合中不存在的键（即坏掉的键）。输出时转大写并去重。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
)

// 旧键盘：找出坏掉的键（按预期文本中首次出现顺序，大写，每个只输出一次）。
func main() {
	in := bufio.NewReader(os.Stdin)
	expected, _ := in.ReadString('\n')
	actual, _ := in.ReadString('\n')
	trim := func(s string) string {
		for len(s) > 0 && (s[len(s)-1] == '\n' || s[len(s)-1] == '\r') {
			s = s[:len(s)-1]
		}
		return s
	}
	expected = trim(expected)
	actual = trim(actual)
	broken := make(map[rune]bool)
	// 实际输出的字符标记为"未坏"
	for _, c := range actual {
		if c >= 'a' && c <= 'z' {
			c = c - 'a' + 'A' // 统一转大写
		}
		broken[c] = true
	}
	seen := make(map[rune]bool)
	var out []rune
	// 遍历期望字符串，找出坏掉的键（按首次出现顺序，去重）
	for _, c := range expected {
		up := c
		if c >= 'a' && c <= 'z' {
			up = c - 'a' + 'A'
		}
		if !broken[up] && !seen[up] {
			seen[up] = true
			out = append(out, up)
		}
	}
	fmt.Println(string(out))
}