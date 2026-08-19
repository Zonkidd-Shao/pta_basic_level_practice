/*
题目：1039 到底买不买
实现原理：统计店家珠子数量，逐个消耗需求；消耗失败次数为缺少数，否则输出剩余数。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// 到底买不买：判断店家珠子能否凑出所需珠子。
func main() {
	in := bufio.NewReader(os.Stdin)
	shop, _ := in.ReadString('\n')
	own, _ := in.ReadString('\n')
	trim := func(s string) string {
		for len(s) > 0 && (s[len(s)-1] == '\n' || s[len(s)-1] == '\r') {
			s = s[:len(s)-1]
		}
		return s
	}
	shop = trim(shop)
	own = trim(own)
	cnt := make(map[rune]int)
	for _, c := range shop {
		cnt[c]++
	}
	missing := 0
	for _, c := range own {
		if cnt[c] > 0 {
			cnt[c]--
		} else {
			missing++
		}
	}
	if missing == 0 {
		fmt.Printf("Yes %d\n", len(shop)-len(own))
	} else {
		fmt.Printf("No %d\n", missing)
	}
}
