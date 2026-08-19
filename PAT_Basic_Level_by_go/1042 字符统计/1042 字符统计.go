/*
题目：1042 字符统计
实现原理：将输入统一转小写，用长度为 26 的数组计数，并从 a 到 z 扫描以自然满足并列时取较小字母。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// 字符统计：统计出现最多的英文字母（不区分大小写），输出小写字母及次数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	s := strings.ToLower(strings.TrimSpace(scanner.Text()))
	cnt := make([]int, 26)
	for _, c := range s {
		if c >= 'a' && c <= 'z' {
			cnt[c-'a']++
		}
	}
	maxC, maxN := 0, -1
	for i := 0; i < 26; i++ {
		if cnt[i] > maxN {
			maxN = cnt[i]
			maxC = i
		}
	}
	fmt.Printf("%c %d\n", 'a'+maxC, maxN)
}
