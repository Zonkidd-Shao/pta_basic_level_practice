/*
题目：1055 集体照
实现原理：按身高降序、姓名升序排序；每行最高者置中，后续人员交替放在右侧和左侧。
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

func arrange(row []string) []string {
	m := len(row)
	res := make([]string, m)
	mid := m / 2
	res[mid] = row[0]
	left, right := mid-1, mid+1
	for i := 1; i < m; i++ {
		if i%2 == 1 {
			res[right] = row[i]
			right++
		} else {
			res[left] = row[i]
			left--
		}
	}
	return res
}

// 集体照：按身高降序、姓名升序排列，每行中间最高，交替左右。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	K, _ := strconv.Atoi(f[1])
	type person struct {
		name string
		h    int
	}
	people := make([]person, N)
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		p := strings.Fields(scanner.Text())
		h, _ := strconv.Atoi(p[1])
		people[i] = person{name: p[0], h: h}
	}
	sort.Slice(people, func(i, j int) bool {
		if people[i].h != people[j].h {
			return people[i].h > people[j].h
		}
		return people[i].name < people[j].name
	})
	m := N / K
	rows := make([][]string, K)
	idx := 0
	for r := 0; r < K; r++ {
		size := m
		if r == 0 {
			size = N - m*(K-1)
		}
		row := make([]string, size)
		for i := 0; i < size; i++ {
			row[i] = people[idx].name
			idx++
		}
		rows[r] = arrange(row)
	}
	var b strings.Builder
	for r := K - 1; r >= 0; r-- {
		b.WriteString(strings.Join(rows[r], " "))
		b.WriteByte('\n')
	}
	fmt.Print(b.String())
}
