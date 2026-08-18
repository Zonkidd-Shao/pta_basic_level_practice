/*
题目：1035 插入与归并
实现原理：插入排序中间态为“有序前缀+未变后缀”；否则模拟归并排序每一趟分块排序，命中后再执行一趟。
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

func equal(a, b []int) bool {
	for i := range a {
		if a[i] != b[i] {
			return false
		}
	}
	return true
}

func mergePass(a []int, step int) {
	n := len(a)
	for i := 0; i < n; i += step {
		end := i + step
		if end > n {
			end = n
		}
		sort.Ints(a[i:end])
	}
}

func formatArr(a []int) string {
	parts := make([]string, len(a))
	for i, v := range a {
		parts[i] = strconv.Itoa(v)
	}
	return strings.Join(parts, " ")
}

// 插入与归并：判断给定的中间序列来自插入排序还是归并排序，并输出下一步结果。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	scanner.Scan()
	orig := strings.Fields(scanner.Text())
	scanner.Scan()
	target := strings.Fields(scanner.Text())
	O := make([]int, N)
	B := make([]int, N)
	for i := 0; i < N; i++ {
		O[i], _ = strconv.Atoi(orig[i])
		B[i], _ = strconv.Atoi(target[i])
	}

	i := 0
	for i < N-1 && B[i] <= B[i+1] {
		i++
	}
	isInsertion := true
	for j := i + 1; j < N; j++ {
		if B[j] != O[j] {
			isInsertion = false
			break
		}
	}
	if isInsertion {
		if i+1 < N {
			x := B[i+1]
			j := i
			for j >= 0 && B[j] > x {
				B[j+1] = B[j]
				j--
			}
			B[j+1] = x
		}
		fmt.Println("Insertion Sort")
		fmt.Println(formatArr(B))
		return
	}

	A := make([]int, N)
	copy(A, O)
	step := 2
	for {
		if equal(A, B) {
			step *= 2
			mergePass(A, step)
			break
		}
		mergePass(A, step)
		step *= 2
	}
	fmt.Println("Merge Sort")
	fmt.Println(formatArr(A))
}
