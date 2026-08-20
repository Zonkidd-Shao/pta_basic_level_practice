/*
 * 题目：1067 试密码
 * 解题思路：
 * 读取正确密码和允许的最大尝试次数 N。每次读取用户输入的尝试密码
 * 并与正确密码比对，若正确则输出 "Welcome in" 并结束；若错误则
 * 输出 "Wrong password: 尝试密码"。当错误次数达到 N 次后，输出
 * "Account locked" 并锁定账户。注意输入行可能包含空格，故使用
 * bufio.Reader 按行读取。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// main 是程序入口函数，处理密码验证流程。
func main() {
	in := bufio.NewReader(os.Stdin)
	// 第一行同时给出正确密码和允许的最大错误次数。
	var correct string
	var N int
	if _, err := fmt.Fscan(in, &correct, &N); err != nil {
		return
	}
	// 丢弃第一行剩余内容，确保后续按行读取尝试密码。
	_, _ = in.ReadString('\n')

	wrong := 0
	for {
		attempt, err := in.ReadString('\n')
		if err != nil && attempt == "" {
			break
		}
		attempt = strings.TrimRight(attempt, "\r\n")
		if attempt == "#" {
			return
		}
		// 密码正确，欢迎进入
		if attempt == correct {
			fmt.Println("Welcome in")
			return
		}
		// 密码错误，输出错误提示
		fmt.Printf("Wrong password: %s\n", attempt)
		wrong++
		if wrong == N {
			fmt.Println("Account locked")
			return
		}
	}
}
