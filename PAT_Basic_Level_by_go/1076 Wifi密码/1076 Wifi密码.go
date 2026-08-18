/*
 * 题目：1076 Wifi 密码
 * 解题思路：
 * 每行给出 4 个选项（A-D），其中被选中的选项标记为 "-T"。
 * 找出每道题选 "T" 的选项字母，将其转换为对应的数字
 * （A->1, B->2, C->3, D->4），最后拼接成一串数字作为密码。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，解析 Wifi 密码。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	// 读取题目数量 N
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	var b strings.Builder
	// 逐行处理每道题的选项
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		for _, opt := range strings.Fields(scanner.Text()) {
			// 选项格式如 "A-T"、"B-F" 等，若第三个字符为 'T' 则为正确选项
			if len(opt) >= 3 && opt[2] == 'T' {
				// 将选项字母转换为对应数字：A->1, B->2, ...
				b.WriteString(string(opt[0] - 'A' + '1'))
			}
		}
	}
	fmt.Println(b.String())
}