/*
题目：1041 考试座位号
实现原理：以试机座位号建表，保存对应的准考证号与考试座位号，查询时直接查表。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
)

// 考试座位号：根据试机座位号查询准考证号与考试座位号。
func main() {
	in := bufio.NewReader(os.Stdin)
	var N int
	if _, err := fmt.Fscan(in, &N); err != nil {
		return
	}
	type info struct {
		id   string
		exam int
	}
	m := make(map[int]info)
	for i := 0; i < N; i++ {
		var id string
		var test, exam int
		fmt.Fscan(in, &id, &test, &exam)
		m[test] = info{id: id, exam: exam}
	}
	var M int
	fmt.Fscan(in, &M)
	for i := 0; i < M; i++ {
		var t int
		fmt.Fscan(in, &t)
		inf := m[t]
		fmt.Printf("%s %d\n", inf.id, inf.exam)
	}
}
