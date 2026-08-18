/*
题目：1121 祖传好运

解题思路：
判断一个数字字符串是否为"祖传好运数"：
从首位开始，每次向右追加一位数字，每步形成的前缀（即前 k 位数字）
必须能被 k 整除（k 从 1 到字符串长度）。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

// isLucky 判断数字字符串 s 是否为祖传好运数
// 即前 k 位组成的数必须能被 k 整除（k = 1, 2, ..., len(s)）
func isLucky(s string) bool {
	prefix := 0
	for i := 0; i < len(s); i++ {
		prefix = prefix*10 + int(s[i]-'0')
		// 第 i+1 位（1-indexed）形成的前缀必须被 (i+1) 整除
		if prefix%(i+1) != 0 {
			return false
		}
	}
	return true
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var k int
	fmt.Fscan(in, &k)
	for i := 0; i < k; i++ {
		var s string
		fmt.Fscan(in, &s)
		if isLucky(s) {
			fmt.Fprintln(out, "Yes")
		} else {
			fmt.Fprintln(out, "No")
		}
	}
}