/*
题目：1050 螺旋矩阵
实现原理：确定差值最小的因子行列，数字降序排序后通过上下左右四个边界顺时针填充。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
)

// 螺旋矩阵：将数字降序填入 m×n 矩阵（m>=n，m-n 最小），顺时针螺旋。
func main() {
	in := bufio.NewReader(os.Stdin)
	var N int
	if _, err := fmt.Fscan(in, &N); err != nil {
		return
	}
	nums := make([]int, N)
	for i := range nums {
		fmt.Fscan(in, &nums[i])
	}
	sort.Sort(sort.Reverse(sort.IntSlice(nums)))
	n := 1
	for i := 1; i*i <= N; i++ {
		if N%i == 0 {
			n = i
		}
	}
	m := N / n
	mat := make([][]int, m)
	for i := range mat {
		mat[i] = make([]int, n)
	}
	left, right, top, bottom := 0, n-1, 0, m-1
	idx := 0
	for left <= right && top <= bottom {
		for j := left; j <= right; j++ {
			mat[top][j] = nums[idx]
			idx++
		}
		top++
		for i := top; i <= bottom; i++ {
			mat[i][right] = nums[idx]
			idx++
		}
		right--
		if top <= bottom {
			for j := right; j >= left; j-- {
				mat[bottom][j] = nums[idx]
				idx++
			}
			bottom--
		}
		if left <= right {
			for i := bottom; i >= top; i-- {
				mat[i][left] = nums[idx]
				idx++
			}
			left++
		}
	}
	var b strings.Builder
	for i := 0; i < m; i++ {
		for j := 0; j < n; j++ {
			if j > 0 {
				b.WriteByte(' ')
			}
			b.WriteString(fmt.Sprint(mat[i][j]))
		}
		b.WriteByte('\n')
	}
	fmt.Print(b.String())
}
