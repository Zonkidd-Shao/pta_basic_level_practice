/*
题目：1041 考试座位号
实现原理：以试机座位号建表，保存对应的准考证号与考试座位号，查询时直接查表。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 考试座位号：根据试机座位号查询准考证号与考试座位号。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	type info struct {
		id   string
		exam int
	}
	m := make(map[int]info)
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		test, _ := strconv.Atoi(f[1])
		exam, _ := strconv.Atoi(f[2])
		m[test] = info{id: f[0], exam: exam}
	}
	scanner.Scan()
	queries := strings.Fields(scanner.Text())
	for _, q := range queries {
		t, _ := strconv.Atoi(q)
		inf := m[t]
		fmt.Printf("%s %d\n", inf.id, inf.exam)
	}
}
