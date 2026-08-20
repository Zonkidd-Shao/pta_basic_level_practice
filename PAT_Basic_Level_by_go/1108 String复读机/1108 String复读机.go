/*
题目：1108 String复读机

解题思路：
给定一个字符串，统计其中字符 'S', 't', 'r', 'i', 'n', 'g' 的出现次数，
然后循环按 "String" 的顺序输出这些字符，直到全部输出完毕。
（注意大小写敏感，'S' 为大写，其余为小写。）
*/

package main

import (
	"bufio"
	"os"
)

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	// 读取输入字符串
	s, _ := in.ReadString('\n')

	// 统计目标字符的出现次数
	count := make(map[byte]int)
	for i := 0; i < len(s); i++ {
		count[s[i]]++
	}

	// 按 "String" 顺序输出
	order := []byte{'S', 't', 'r', 'i', 'n', 'g'}
	total := 0
	for _, c := range order {
		total += count[c]
	}

	// 循环按顺序输出，每轮输出 "String" 中各字符一次（若还有剩余）
	for total > 0 {
		for _, c := range order {
			if count[c] > 0 {
				out.WriteByte(c)
				count[c]--
				total--
			}
		}
	}
	out.WriteByte('\n')
}
