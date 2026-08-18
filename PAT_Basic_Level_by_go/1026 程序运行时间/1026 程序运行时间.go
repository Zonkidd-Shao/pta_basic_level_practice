/*
 * 题目：1026 程序运行时间
 * 实现原理：两个时钟读数之差除以 100（每秒 100 个时钟周期），加 50 实现四舍五入，
 * 然后将总秒数换算为 hh:mm:ss 格式输出。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 将两次时钟读数之差换算为 hh:mm:ss（每秒 100 个时钟周期，四舍五入）。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	c1, _ := strconv.Atoi(f[0])
	c2, _ := strconv.Atoi(f[1])
	total := (c2 - c1 + 50) / 100 // 加 50 实现四舍五入，换算为秒
	h := total / 3600
	m := (total % 3600) / 60
	s := total % 60
	fmt.Printf("%02d:%02d:%02d\n", h, m, s)
}