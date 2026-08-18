/*
 * 题目：1030 完美数列
 * 实现原理：先将数组排序，然后用双指针法（滑动窗口）寻找满足 arr[j] ≤ arr[i]*p
 * 的最长子列长度。右指针 j 每次后移，左指针 i 在不满足条件时后移，
 * 记录过程中窗口的最大长度。
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

// 完美数列：找出满足 max ≤ min*p 的最长子列长度。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	p, _ := strconv.ParseFloat(f[1], 64)
	scanner.Scan()
	nums := strings.Fields(scanner.Text())
	arr := make([]int, N)
	for i := 0; i < N; i++ {
		arr[i], _ = strconv.Atoi(nums[i])
	}
	sort.Ints(arr) // 排序后使用滑动窗口
	maxLen := 0
	i := 0
	for j := 0; j < N; j++ {
		// 当最小值乘 p 小于当前最大值时，左指针右移
		for float64(arr[i])*p < float64(arr[j]) {
			i++
		}
		if j-i+1 > maxLen {
			maxLen = j - i + 1
		}
	}
	fmt.Println(maxLen)
}