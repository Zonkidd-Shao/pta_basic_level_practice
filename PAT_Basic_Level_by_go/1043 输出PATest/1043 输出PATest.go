/*
题目：1043 输出PATest
实现原理：统计各目标字符频次，按 P、A、T、e、s、t 的固定顺序循环取出尚有剩余的字符。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// 输出PATest：按 P A T e s t 顺序循环输出字母，直到耗尽。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	s := strings.TrimSpace(scanner.Text())
	cnt := make(map[rune]int)
	for _, c := range s {
		cnt[c]++
	}
	order := []rune{'P', 'A', 'T', 'e', 's', 't'}
	var b strings.Builder
	for {
		empty := true
		for _, c := range order {
			if cnt[c] > 0 {
				b.WriteRune(c)
				cnt[c]--
				empty = false
			}
		}
		if empty {
			break
		}
	}
	fmt.Println(b.String())
}
