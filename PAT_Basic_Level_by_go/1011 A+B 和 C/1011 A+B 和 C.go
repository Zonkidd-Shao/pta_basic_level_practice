// 题目：1011 A+B 和 C
// 实现原理：给定 T 组测试用例，每组给出三个整数 A、B、C，判断 A+B 是否大于 C。
// 使用 int64 类型避免大数溢出。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取 T 组数据并逐组判断 A+B > C 是否成立。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	t, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	for i := 1; i <= t; i++ {
		if !scanner.Scan() {
			return
		}
		f := strings.Fields(scanner.Text())
		// 使用 int64 防止溢出
		a, _ := strconv.ParseInt(f[0], 10, 64)
		b, _ := strconv.ParseInt(f[1], 10, 64)
		c, _ := strconv.ParseInt(f[2], 10, 64)
		if a+b > c {
			fmt.Printf("Case #%d: true\n", i)
		} else {
			fmt.Printf("Case #%d: false\n", i)
		}
	}
}