/*
题目：1033 旧键盘打字
实现原理：将坏键存入集合，逐字符模拟输入；大写字母还受 Shift（'+'）坏键影响。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
)

// 旧键盘打字：坏键无法输出，'+' 坏则无法输出任何大写字母。
func main() {
	in := bufio.NewReader(os.Stdin)
	brokenLine, _ := in.ReadString('\n')
	text, _ := in.ReadString('\n')
	trim := func(s string) string {
		for len(s) > 0 && (s[len(s)-1] == '\n' || s[len(s)-1] == '\r') {
			s = s[:len(s)-1]
		}
		return s
	}
	brokenLine = trim(brokenLine)
	text = trim(text)
	broken := make(map[rune]bool)
	for _, c := range brokenLine {
		broken[c] = true
	}
	var out []rune
	for _, c := range text {
		if c >= 'A' && c <= 'Z' {
			if broken['+'] || broken[c] {
				continue
			}
			out = append(out, c)
		} else if c >= 'a' && c <= 'z' {
			if broken[c-'a'+'A'] {
				continue
			}
			out = append(out, c)
		} else if broken[c] {
			continue
		} else {
			out = append(out, c)
		}
	}
	fmt.Println(string(out))
}
