// 题目：1083 是否存在相等的差
// 实现原理：给定 N 张卡片，正面数字为 1..N，将正面数字 a[i] 与下标 i+1（即正面原始值）
// 做差并取绝对值。使用哈希表（map）统计每个差值出现的次数。遍历结束后，筛选出出现次数
// 大于 1 的差值，按差值从大到小排序并输出。

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

// abs 返回整数 x 的绝对值。
func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

// main 是程序入口，读取输入并统计差值出现次数，输出出现次数大于 1 的差值。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text())) // 读取卡片数量
	scanner.Scan()
	nums := strings.Fields(scanner.Text())
	cnt := make(map[int]int) // 差值 -> 出现次数
	for i := 0; i < N; i++ {
		v, _ := strconv.Atoi(nums[i])
		cnt[abs(v-(i+1))]++ // 计算 |正面数字 - 原始位置| 并计数
	}
	type pair struct{ diff, c int }
	pairs := make([]pair, 0)
	for d, c := range cnt {
		if c > 1 { // 只保留出现次数大于 1 的差值
			pairs = append(pairs, pair{d, c})
		}
	}
	// 按差值从大到小排序
	sort.Slice(pairs, func(i, j int) bool { return pairs[i].diff > pairs[j].diff })
	for _, p := range pairs {
		fmt.Printf("%d %d\n", p.diff, p.c)
	}
}