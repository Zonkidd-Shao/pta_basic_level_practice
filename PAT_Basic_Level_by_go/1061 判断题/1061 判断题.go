/*
 * 题目：1061 判断题
 * 解题思路：
 * 读取每道题的满分值和正确答案，然后逐行读取每位学生的作答，
 * 将学生的答案与标准答案比对，若一致则累加该题分值，最后输出每位学生的总分。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，处理判断题的计分流程。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	// 读取第一行：学生人数 N 和题目数量 M
	first := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(first[0])
	M, _ := strconv.Atoi(first[1])

	// 读取第二行：每道题的标准答案
	scanner.Scan()
	answers := strings.Fields(scanner.Text())
	// 读取第三行：每道题的分值
	scanner.Scan()
	scores := strings.Fields(scanner.Text())

	ans := make([]byte, M) // 存储标准答案
	sc := make([]int, M)   // 存储每道题的分值
	for i := 0; i < M; i++ {
		ans[i] = answers[i][0]       // 取答案字符
		sc[i], _ = strconv.Atoi(scores[i]) // 解析分值
	}

	// 逐行处理每位学生的作答
	stuScores := make([]int, N)
	for s := 0; s < N; s++ {
		if !scanner.Scan() {
			break
		}
		resp := strings.Fields(scanner.Text())
		for i := 0; i < M; i++ {
			// 答案正确则累加对应分值
			if resp[i][0] == ans[i] {
				stuScores[s] += sc[i]
			}
		}
	}

	// 输出每位学生的总分
	for _, v := range stuScores {
		fmt.Println(v)
	}
}