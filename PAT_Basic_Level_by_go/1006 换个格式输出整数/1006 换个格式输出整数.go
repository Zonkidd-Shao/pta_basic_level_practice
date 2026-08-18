// 题目：1006 换个格式输出整数
// 实现原理：将一个不超过 3 位的正整数按位分解，百位用 B 表示，十位用 S 表示，
// 个位用连续的数字 1~n 表示（n 为个位数字）。逐位拼接输出即可。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取一个正整数并按照格式规则输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	n, err := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	if err != nil {
		return
	}
	var b strings.Builder
	// 输出表示百位的 B
	for i := 0; i < n/100; i++ {
		b.WriteByte('B')
	}
	// 输出表示十位的 S
	for i := 0; i < (n%100)/10; i++ {
		b.WriteByte('S')
	}
	// 输出个位的连续数字 1~n
	for i := 1; i <= n%10; i++ {
		b.WriteByte(byte('0' + i))
	}
	fmt.Println(b.String())
}