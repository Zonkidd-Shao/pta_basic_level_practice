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
	// 读取第一行：正确密码
	correct, _ := in.ReadString('\n')
	correct = strings.TrimRight(correct, "\r\n")
	// 读取第二行：最大尝试次数 N
	nLine, _ := in.ReadString('\n')
	N := 0
	fmt.Sscanf(strings.TrimSpace(nLine), "%d", &N)

	// 逐行读取尝试密码，最多 N 次
	for i := 0; i < N; i++ {
		attempt, err := in.ReadString('\n')
		if err != nil {
			break
		}
		attempt = strings.TrimRight(attempt, "\r\n")
		// 密码正确，欢迎进入
		if attempt == correct {
			fmt.Println("Welcome in")
			return
		}
		// 密码错误，输出错误提示
		fmt.Printf("Wrong password: %s\n", attempt)
	}
	// 超出尝试次数，账户锁定
	fmt.Println("Account locked")
}