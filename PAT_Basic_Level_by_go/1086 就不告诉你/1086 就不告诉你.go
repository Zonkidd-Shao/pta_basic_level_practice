// 题目：1086 就不告诉你
// 实现原理：读取两个正整数 A 和 B，计算它们的乘积，然后将乘积的十进制数字
// 反转后输出（去掉前导零的效果由反转自然实现）。例如，乘积为 123，反转后输出 321。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

// main 是程序入口，读取 A 和 B，计算乘积并反转数字后输出。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var a, b int
	if _, err := fmt.Fscan(in, &a, &b); err != nil {
		return
	}
	prod := a * b          // 计算乘积
	s := strconv.Itoa(prod) // 将乘积转为字符串
	// 从后向前遍历，实现数字反转
	for i := len(s) - 1; i >= 0; i-- {
		out.WriteByte(s[i])
	}
	out.WriteByte('\n')
}