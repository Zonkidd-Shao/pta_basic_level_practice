// 题目：1098 岩洞施工
// 实现原理：给定岩洞的顶部轮廓线和底部轮廓线（各 N 个点），施工时需要
// 在顶部和底部之间铺设管道，相当于寻找顶部最低点和底部最高点之间的最小
// 间距。遍历每列，计算顶部与底部的高度差 gap = top[i] - bottom[i]，
// 取所有 gap 的最小值。若最小值 >= 1，则输出 "Yes" 和该最小值（最大管道
// 宽度 + 高度）；否则输出 "No" 和需要向下挖的深度（1 - minGap）。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取岩洞轮廓数据并计算最小施工间距。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)
	top := make([]int, n)    // 顶部轮廓各点高度
	for i := 0; i < n; i++ {
		fmt.Fscan(in, &top[i])
	}
	bottom := make([]int, n) // 底部轮廓各点高度
	for i := 0; i < n; i++ {
		fmt.Fscan(in, &bottom[i])
	}
	minGap := 1 << 30 // 初始化最小间距为一个很大的值
	for i := 0; i < n; i++ {
		gap := top[i] - bottom[i] // 计算第 i 列的可用空间
		if gap < minGap {
			minGap = gap
		}
	}
	if minGap >= 1 {
		fmt.Fprintf(out, "Yes %d\n", minGap)
	} else {
		fmt.Fprintf(out, "No %d\n", 1-minGap) // 需要向下挖的深度
	}
}