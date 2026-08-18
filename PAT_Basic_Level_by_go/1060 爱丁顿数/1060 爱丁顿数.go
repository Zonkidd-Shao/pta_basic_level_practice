/*
题目：1060 爱丁顿数
实现原理：将骑行距离降序排列；第 i 个距离大于 i 时，说明至少有 i 天距离超过 i，持续更新最大值。
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

// 爱丁顿数：最大的 e，使得至少有 e 天骑行距离超过 e。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	scanner.Scan()
	dist := strings.Fields(scanner.Text())
	a := make([]int, N)
	for i := 0; i < N; i++ {
		a[i], _ = strconv.Atoi(dist[i])
	}
	sort.Sort(sort.Reverse(sort.IntSlice(a)))
	e := 0
	for i := 0; i < N; i++ {
		if a[i] > i+1 {
			e = i + 1
		} else {
			break
		}
	}
	fmt.Println(e)
}
