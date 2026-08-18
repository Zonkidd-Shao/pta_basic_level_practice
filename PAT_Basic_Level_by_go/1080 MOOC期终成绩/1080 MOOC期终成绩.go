/*
 * 题目：1080 MOOC 期终成绩
 * 解题思路：
 * 将编程分、期中分、期末分三个成绩表合并，对每位学生计算总评成绩：
 *   若期中分 > 期末分，总评 = 期中×40% + 期末×60%（四舍五入）；
 *   否则总评 = 期末分。
 * 筛选条件：编程分 >= 200 且总评 >= 60，然后按总评降序（同分按学号升序）输出。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

type student struct {
	id         string
	gp, gmid   int // 编程分、期中分
	gfin, g    int // 期末分、总评
}

// main 是程序入口函数，合并成绩表并输出合格学生信息。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 4*1024*1024), 4*1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	P, _ := strconv.Atoi(f[0]) // 编程成绩人数
	M, _ := strconv.Atoi(f[1]) // 期中成绩人数
	N, _ := strconv.Atoi(f[2]) // 期末成绩人数

	// 读取编程分（学号 -> 分数）
	gp := make(map[string]int)
	for i := 0; i < P; i++ {
		if !scanner.Scan() {
			break
		}
		p := strings.Fields(scanner.Text())
		v, _ := strconv.Atoi(p[1])
		gp[p[0]] = v
	}

	// 读取期中分（学号 -> 分数）
	gmid := make(map[string]int)
	for i := 0; i < M; i++ {
		if !scanner.Scan() {
			break
		}
		p := strings.Fields(scanner.Text())
		v, _ := strconv.Atoi(p[1])
		gmid[p[0]] = v
	}

	// 读取期末分（学号 -> 分数）
	gfin := make(map[string]int)
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		p := strings.Fields(scanner.Text())
		v, _ := strconv.Atoi(p[1])
		gfin[p[0]] = v
	}

	// 合并成绩，计算总评并筛选合格学生
	students := make([]student, 0)
	for id, p := range gp {
		fin, okf := gfin[id]
		if !okf {
			continue // 没有期末成绩则跳过
		}
		mid, okm := gmid[id]
		if !okm {
			mid = -1 // 没有期中分标记为 -1
		}

		var g int
		if mid > fin {
			// 期中分高于期末分时，按比例加权（四舍五入）
			g = int(float64(mid)*0.4 + float64(fin)*0.6 + 0.5)
		} else {
			g = fin // 否则以期末分为总评
		}

		// 筛选条件：编程分 >= 200 且总评 >= 60
		if p >= 200 && g >= 60 {
			students = append(students, student{id: id, gp: p, gmid: mid, gfin: fin, g: g})
		}
	}

	// 按总评降序、学号升序排序
	sort.Slice(students, func(i, j int) bool {
		if students[i].g != students[j].g {
			return students[i].g > students[j].g
		}
		return students[i].id < students[j].id
	})

	// 输出合格学生信息
	for _, s := range students {
		fmt.Printf("%s %d %d %d %d\n", s.id, s.gp, s.gmid, s.gfin, s.g)
	}
}