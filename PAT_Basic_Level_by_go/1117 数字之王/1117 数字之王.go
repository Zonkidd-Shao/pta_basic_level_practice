/*
题目：1117 数字之王

解题思路：
给定区间 [n1, n2]，对区间内每个数做如下变换：
  1. 将该数的各位数字分别立方后相乘
  2. 将乘积的各位数字相加
重复上述变换直到所有数都变成一位数（0-9）。
统计每个一位数出现的次数，输出出现次数最多的值（可能有多个，升序输出）。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
)

// transform 对一个数执行一次变换：各位数字立方相乘，再对乘积各位数字求和
func transform(x int) int {
	if x == 0 {
		return 0
	}
	// 提取各位数字
	digits := []int{}
	for x > 0 {
		digits = append(digits, x%10)
		x /= 10
	}

	// 各位数字立方后相乘
	prod := 1
	for _, d := range digits {
		prod *= d * d * d
	}

	// 对乘积的各位数字求和
	s := 0
	for prod > 0 {
		s += prod % 10
		prod /= 10
	}
	return s
}

// allSingle 判断 batch 中所有数是否已变为一位数
func allSingle(batch []int) bool {
	for _, v := range batch {
		if v >= 10 {
			return false
		}
	}
	return true
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n1, n2 int
	fmt.Fscan(in, &n1, &n2)

	// 初始化区间内所有数。
	batch := make([]int, 0, n2-n1+1)
	for x := n1; x <= n2; x++ {
		batch = append(batch, x)
	}

	// 每一轮都对所有数字执行变换，直到本轮结果全部为一位数。
	for {
		for i := range batch {
			batch[i] = transform(batch[i])
		}
		if allSingle(batch) {
			break
		}
	}

	// 统计每个一位数出现的次数
	count := make(map[int]int)
	for _, v := range batch {
		count[v]++
	}

	// 找出出现次数最多的值
	maxCnt := 0
	for _, c := range count {
		if c > maxCnt {
			maxCnt = c
		}
	}
	var kings []int
	for d, c := range count {
		if c == maxCnt {
			kings = append(kings, d)
		}
	}

	// 升序输出
	sort.Ints(kings)
	fmt.Fprintln(out, maxCnt)
	for i, k := range kings {
		if i > 0 {
			out.WriteByte(' ')
		}
		fmt.Fprint(out, k)
	}
	out.WriteByte('\n')
}
