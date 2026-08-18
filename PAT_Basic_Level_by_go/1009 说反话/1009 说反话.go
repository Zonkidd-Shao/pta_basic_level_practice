// 题目：1009 说反话
// 实现原理：读入一个英文句子（由若干单词组成，空格分隔），将单词顺序颠倒后输出。
// 使用 strings.Fields 按空格分割，然后逆序遍历拼接即可。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// main 是程序入口函数，读取句子并输出单词顺序颠倒的结果。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	words := strings.Fields(scanner.Text())
	var b strings.Builder
	// 逆序遍历单词切片
	for i := len(words) - 1; i >= 0; i-- {
		if b.Len() > 0 {
			b.WriteByte(' ')
		}
		b.WriteString(words[i])
	}
	fmt.Println(b.String())
}