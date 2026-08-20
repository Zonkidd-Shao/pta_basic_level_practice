// 题目：1081 检查密码
// 实现原理：读取 N 个密码字符串，依次检查其合法性。先判断长度是否 >= 6，
// 再逐字符扫描，检查是否含有数字（hasDigit）、字母（hasLetter）以及非法字符（illegal）。
// 根据检查结果输出对应的提示信息。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口，读取输入并逐条检查密码的合法性，输出判定结果。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text())) // 读取密码条数
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		pwd := strings.TrimRight(scanner.Text(), "\r\n") // 去除行尾换行符
		// 检查长度是否达标
		if len(pwd) < 6 {
			fmt.Println("Your password is tai duan le.")
			continue
		}
		hasDigit, hasLetter, illegal := false, false, false
		// 逐字符检查密码内容
		for _, c := range pwd {
			if c >= '0' && c <= '9' {
				hasDigit = true
			} else if (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') {
				hasLetter = true
			} else {
				illegal = true
			}
		}
		// 根据检查结果输出对应提示
		if !hasDigit {
			fmt.Println("Your password needs shu zi.")
		} else if !hasLetter {
			fmt.Println("Your password needs zi mu.")
		} else if illegal {
			fmt.Println("Your password is tai luan le.")
		} else {
			fmt.Println("Your password is wan mei.")
		}
	}
}
