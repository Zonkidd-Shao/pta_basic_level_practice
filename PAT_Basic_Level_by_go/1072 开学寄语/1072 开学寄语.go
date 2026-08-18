/*
 * 题目：1072 开学寄语
 * 解题思路：
 * 读取被禁止携带的物品列表，然后逐行检查每位学生携带的物品。
 * 若学生携带违禁物品，输出该学生姓名及所有违禁品名称，并统计
 * 携带违禁品的学生人数和违禁品总件数，最后输出统计结果。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，检查学生携带的违禁物品。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0]) // 学生人数
	M, _ := strconv.Atoi(f[1]) // 违禁物品种类数

	// 读取违禁物品编号列表，存入集合
	scanner.Scan()
	forbidden := make(map[string]bool)
	for _, s := range strings.Fields(scanner.Text()) {
		forbidden[s] = true
	}

	studentCnt, itemCnt := 0, 0
	// 逐行处理每位学生的物品
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		fields := strings.Fields(scanner.Text())
		name := fields[0]  // 学生姓名
		K, _ := strconv.Atoi(fields[1]) // 携带物品数量

		// 检查该学生的所有物品是否违禁
		bad := make([]string, 0)
		for j := 2; j < 2+K && j < len(fields); j++ {
			if forbidden[fields[j]] {
				bad = append(bad, fields[j])
			}
		}

		// 若有违禁物品，输出并累加统计
		if len(bad) > 0 {
			studentCnt++
			itemCnt += len(bad)
			fmt.Printf("%s: %s\n", name, strings.Join(bad, " "))
		}
	}

	// 输出违禁学生人数和违禁品总件数
	fmt.Printf("%d %d\n", studentCnt, itemCnt)
}