/*
题目：1120 买地攻略

解题思路：
给定 N 块连续的土地价格和预算 M，求有多少种连续子区间（即连续地块）
的价格之和不超过 M。
使用滑动窗口（双指针）法，右指针向右扩展，当和超过 M 时左指针右移，
每次右指针位置固定时，以 right 结尾的合法子区间数为 right - left + 1。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n, m int
	fmt.Fscan(in, &n, &m)

	// 读取每块土地的价格
	prices := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Fscan(in, &prices[i])
	}

	// 滑动窗口统计合法子区间数
	ans := 0
	left := 0
	sum := 0
	for right := 0; right < n; right++ {
		sum += prices[right]
		// 当窗口和超过 M 时，收缩左边界
		for sum > m {
			sum -= prices[left]
			left++
		}
		// 以 right 结尾的合法子区间数量
		ans += right - left + 1
	}
	fmt.Fprintln(out, ans)
}