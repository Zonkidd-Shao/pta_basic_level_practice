/*
 * 题目：1077 互评成绩计算
 * 解题思路：
 * 每位学生有一组成绩：第一个是教师打分，其余是学生互评打分。
 * 从学生互评中筛除无效分（不在 [0, M] 范围内的分），
 * 剩下的去掉一个最高分和一个最低分，取算术平均作为 G1。
 * 最终成绩 = (G1 + 教师分 G2) / 2，四舍五入取整输出。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，计算每位学生的互评最终成绩。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0]) // 学生人数
	M, _ := strconv.Atoi(f[1]) // 互评满分

	scores := make([]int, N)
	// 逐行处理每位学生的成绩
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		fields := strings.Fields(scanner.Text())
		g2, _ := strconv.Atoi(fields[0]) // 教师打分

		// 筛选有效互评分数（在 [0, M] 范围内）
		valid := make([]int, 0)
		for j := 1; j < len(fields); j++ {
			v, _ := strconv.Atoi(fields[j])
			if v >= 0 && v <= M {
				valid = append(valid, v)
			}
		}

		// 找最高分和最低分
		maxV, minV := -1, 1<<30
		for _, v := range valid {
			if v > maxV {
				maxV = v
			}
			if v < minV {
				minV = v
			}
		}

		// 去掉最高最低后求平均（整数除法自动向下取整）
		sum := 0
		for _, v := range valid {
			sum += v
		}
		g1 := (sum - maxV - minV) / (len(valid) - 2)

		// 最终成绩 = (G1 + G2) / 2，四舍五入
		scores[i] = int(float64(g1+g2)/2.0 + 0.5)
	}

	// 输出每位学生的最终成绩
	for _, s := range scores {
		fmt.Println(s)
	}
}