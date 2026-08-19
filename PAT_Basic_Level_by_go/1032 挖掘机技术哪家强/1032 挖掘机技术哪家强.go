/*
题目：1032 挖掘机技术哪家强
实现原理：哈希表按学校编号累加分数，并在更新时维护最高总分。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 挖掘机技术哪家强：统计各校总分，输出最高分学校及其总分。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	scores := make(map[int]int)
	maxSchool, maxScore := 0, -1
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		school, _ := strconv.Atoi(f[0])
		score, _ := strconv.Atoi(f[1])
		scores[school] += score
		if scores[school] > maxScore {
			maxScore = scores[school]
			maxSchool = school
		}
	}
	fmt.Printf("%d %d\n", maxSchool, maxScore)
}
