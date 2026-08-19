/*
题目：1045 快速排序
实现原理：预处理每位置左侧最大值和右侧最小值；同时等于二者的元素即可能成为主元。
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

// 快速排序：找出可能是主元的元素（左边都小、右边都大），升序输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	scanner.Scan()
	fields := strings.Fields(scanner.Text())
	a := make([]int, N)
	for i := 0; i < N; i++ {
		a[i], _ = strconv.Atoi(fields[i])
	}
	leftMax := make([]int, N)
	rightMin := make([]int, N)
	lm := -(1 << 62)
	for i := 0; i < N; i++ {
		if a[i] > lm {
			lm = a[i]
		}
		leftMax[i] = lm
	}
	rm := 1 << 62
	for i := N - 1; i >= 0; i-- {
		if a[i] < rm {
			rm = a[i]
		}
		rightMin[i] = rm
	}
	cands := make([]int, 0)
	for i := 0; i < N; i++ {
		if a[i] == leftMax[i] && a[i] == rightMin[i] {
			cands = append(cands, a[i])
		}
	}
	sort.Ints(cands)
	fmt.Println(len(cands))
	if len(cands) == 0 {
		fmt.Println()
	} else {
		var b strings.Builder
		for i, v := range cands {
			if i > 0 {
				b.WriteByte(' ')
			}
			b.WriteString(strconv.Itoa(v))
		}
		fmt.Println(b.String())
	}
}
