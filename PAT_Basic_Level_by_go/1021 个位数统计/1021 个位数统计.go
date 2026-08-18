/*
 * 题目：1021 个位数统计
 * 实现原理：读取一个字符串，遍历每个字符将其转为数字并累加计数到长度为 10 的数组中，
 * 最后按数字 0~9 的顺序输出出现次数不为零的数字及其次数。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// 统计字符串中每个数字字符出现的次数（按数字升序输出）。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	s := strings.TrimSpace(scanner.Text())
	cnt := [10]int{} // 用固定长度数组统计 0~9 每个数字的出现次数
	for i := 0; i < len(s); i++ {
		cnt[s[i]-'0']++ // 字符转数字并累加
	}
	var b strings.Builder
	for d := 0; d < 10; d++ {
		if cnt[d] > 0 {
			fmt.Fprintf(&b, "%d:%d\n", d, cnt[d]) // 按格式输出
		}
	}
	fmt.Print(b.String())
}