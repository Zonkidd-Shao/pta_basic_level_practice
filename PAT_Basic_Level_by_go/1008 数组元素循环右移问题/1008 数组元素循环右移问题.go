// 题目：1008 数组元素循环右移问题
// 实现原理：将长度为 n 的数组循环右移 m 位（m 可能大于 n，先取模）。
// 不实际移动数组，而是将数组分为两段：[n-m:] 和 [:n-m]，拼接后输出即可。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取数组和右移位数，按循环右移后的顺序输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	first := strings.Fields(scanner.Text())
	n, _ := strconv.Atoi(first[0])
	m, _ := strconv.Atoi(first[1])
	if n == 0 {
		return
	}
	m %= n // 取模，简化右移位数
	if !scanner.Scan() {
		return
	}
	arr := strings.Fields(scanner.Text())
	// 将后半段 [n-m:] 移到前面，前半段 [:n-m] 移到后面
	res := append(append([]string{}, arr[n-m:]...), arr[:n-m]...)
	fmt.Println(strings.Join(res, " "))
}