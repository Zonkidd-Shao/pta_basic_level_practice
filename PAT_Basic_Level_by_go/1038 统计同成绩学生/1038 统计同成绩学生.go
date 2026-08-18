/*
题目：1038 统计同成绩学生
实现原理：成绩范围为 0~100，以成绩为下标计数；每次查询可直接 O(1) 取频次。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 统计同成绩学生：对每个查询的分数输出出现次数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	scanner.Scan()
	scores := strings.Fields(scanner.Text())
	cnt := make([]int, 101)
	for _, s := range scores {
		v, _ := strconv.Atoi(s)
		cnt[v]++
	}
	scanner.Scan()
	queries := strings.Fields(scanner.Text())
	var b strings.Builder
	for i, q := range queries {
		v, _ := strconv.Atoi(q)
		if i > 0 {
			b.WriteByte(' ')
		}
		b.WriteString(strconv.Itoa(cnt[v]))
	}
	fmt.Println(b.String())
}
