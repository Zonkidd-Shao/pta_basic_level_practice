// 题目：1003 我要通过！
// 实现原理：判断字符串是否符合"答案正确"的条件。正确字符串仅包含 P、A、T 三种字符，
// 且恰好有一个 P 和一个 T，P 在 T 之前。设 P 前 A 的个数为 a，P 与 T 之间 A 的个数为 b，
// T 之后 A 的个数为 c，则需要满足 a*b == c 且 b >= 1。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// isValid 判断字符串 s 是否符合"答案正确"的条件。
// 返回值：true 表示符合条件，false 表示不符合。
func isValid(s string) bool {
	countP, countT := 0, 0
	posP, posT := -1, -1
	// 遍历字符串，统计 P 和 T 的个数及位置
	for i, c := range s {
		switch c {
		case 'P':
			countP++
			posP = i
		case 'T':
			countT++
			posT = i
		case 'A':
			// 合法字符，不做处理
		default:
			return false // 出现非法字符
		}
	}
	// P 和 T 必须恰好各出现一次，且 P 在 T 之前
	if countP != 1 || countT != 1 || posP >= posT {
		return false
	}
	a := posP               // P 前面 A 的个数
	b := posT - posP - 1    // P 与 T 之间 A 的个数
	c := len(s) - posT - 1  // T 后面 A 的个数
	if b < 1 {
		return false // P 和 T 之间至少有一个 A
	}
	return a*b == c
}

// main 是程序入口函数，读取多行字符串并逐行判断是否符合条件。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	// 第一行是待检测字符串个数，直接忽略
	for scanner.Scan() {
		line := strings.TrimRight(scanner.Text(), "\r")
		if line == "" {
			continue
		}
		if isValid(line) {
			fmt.Println("YES")
		} else {
			fmt.Println("NO")
		}
	}
}