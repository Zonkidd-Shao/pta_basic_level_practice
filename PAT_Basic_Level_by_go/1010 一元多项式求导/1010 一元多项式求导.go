// 题目：1010 一元多项式求导
// 实现原理：输入为多项式的系数和指数对（指数递降），对每对求导得到新的系数 c*e 和
// 指数 e-1。忽略指数为 0 的项（常数项导数为 0），若所有项均为零则输出 "0 0"。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取多项式的系数指数对并输出求导结果。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	fields := strings.Fields(scanner.Text())
	out := make([]string, 0)
	// 每两个字段为一对：系数和指数
	for i := 0; i+1 < len(fields); i += 2 {
		c, _ := strconv.Atoi(fields[i])
		e, _ := strconv.Atoi(fields[i+1])
		if e != 0 {
			// 求导公式：c*x^e -> (c*e)*x^(e-1)
			out = append(out, strconv.Itoa(c*e), strconv.Itoa(e-1))
		}
		// 指数为 0 的常数项导数为 0，不输出
	}
	// 如果没有非零导数项，输出 "0 0"
	if len(out) == 0 {
		fmt.Println("0 0")
		return
	}
	fmt.Println(strings.Join(out, " "))
}