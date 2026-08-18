/*
题目：1047 编程团体赛
实现原理：按队号在哈希表中累加个人分数，并同步记录最高分队伍。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 编程团体赛：统计各队总分，输出冠军队伍及其总分。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	scores := make(map[int]int)
	maxTeam, maxScore := 0, -1
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		team, _ := strconv.Atoi(f[0])
		score, _ := strconv.Atoi(f[2])
		scores[team] += score
		if scores[team] > maxScore {
			maxScore = scores[team]
			maxTeam = team
		}
	}
	fmt.Printf("%d %d\n", maxTeam, maxScore)
}
