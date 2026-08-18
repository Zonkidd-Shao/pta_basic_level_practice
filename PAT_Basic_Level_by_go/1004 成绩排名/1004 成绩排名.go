// 题目：1004 成绩排名
// 实现原理：读入 n 名学生的姓名、学号、成绩，遍历所有学生，记录成绩最高和最低的
// 学生信息，最后输出最高分和最低分学生的姓名与学号。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// student 结构体表示一名学生的基本信息
type student struct {
	name  string
	id    string
	score int
}

// main 是程序入口函数，读取学生信息，找出最高分和最低分并输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	// 初始化最高分和最低分记录
	maxS := student{score: -1}
	minS := student{score: 101}
	// 逐行读取学生信息
	for scanner.Scan() {
		fields := strings.Fields(scanner.Text())
		if len(fields) < 3 {
			continue
		}
		score, err := strconv.Atoi(fields[2])
		if err != nil {
			continue
		}
		s := student{name: fields[0], id: fields[1], score: score}
		// 更新最高分
		if score > maxS.score {
			maxS = s
		}
		// 更新最低分
		if score < minS.score {
			minS = s
		}
	}
	fmt.Printf("%s %s\n", maxS.name, maxS.id)
	fmt.Printf("%s %s\n", minS.name, minS.id)
}