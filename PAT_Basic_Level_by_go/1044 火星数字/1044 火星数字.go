/*
题目：1044 火星数字
实现原理：火星数字视作 13 进制的高位和低位词；分别完成十进制到词组及词组到十进制的转换。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

var low = []string{"tret", "jan", "feb", "mar", "apr", "may", "jun", "jly", "aug", "sep", "oct", "nov", "dec"}
var high = []string{"", "tam", "hel", "maa", "huh", "tou", "kes", "hei", "elo", "syy", "lok", "mer", "jou"}

func earthToMars(n int) string {
	if n == 0 {
		return "tret"
	}
	h, l := n/13, n%13
	if h > 0 && l > 0 {
		return high[h] + " " + low[l]
	}
	if h > 0 {
		return high[h]
	}
	return low[l]
}

func marsToEarth(s string) int {
	parts := strings.Fields(s)
	if len(parts) == 1 {
		w := parts[0]
		if w == "tret" {
			return 0
		}
		for i, v := range low {
			if v == w {
				return i
			}
		}
		for i, v := range high {
			if v == w {
				return i * 13
			}
		}
		return 0
	}
	a, b := parts[0], parts[1]
	h, l := 0, 0
	for i, v := range high {
		if v == a {
			h = i
		}
	}
	for i, v := range low {
		if v == b {
			l = i
		}
	}
	return h*13 + l
}

// 火星数字：地球数字与火星数字（13进制）互译。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		line := strings.TrimSpace(scanner.Text())
		if line[0] >= '0' && line[0] <= '9' {
			n, _ := strconv.Atoi(line)
			fmt.Println(earthToMars(n))
		} else {
			fmt.Println(marsToEarth(line))
		}
	}
}
