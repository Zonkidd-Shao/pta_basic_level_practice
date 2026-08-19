/*
题目：1036 跟奥巴马一起编程
实现原理：首尾行重复输出给定字符；中间行仅保留左右边框字符，构造空心正方形。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 跟奥巴马一起编程：用给定字符打印 n×n 的空心正方形。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	n, _ := strconv.Atoi(f[0])
	c := f[1][0]
	for i := 0; i < n; i++ {
		if i == 0 || i == n-1 {
			fmt.Println(strings.Repeat(string(c), n))
		} else {
			fmt.Printf("%c%s%c\n", c, strings.Repeat(" ", n-2), c)
		}
	}
}
