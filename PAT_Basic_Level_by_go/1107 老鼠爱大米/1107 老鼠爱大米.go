/*
题目：1107 老鼠爱大米

解题思路：
有 N 组数据，每组 M 个正整数。对每组找出最大值（组冠军），
同时找出所有组最大值中的最大值（总冠军）。
最后输出各组冠军以及总冠军。
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

	// 存储每组的最大值
	champs := make([]int, n)
	overall := 0 // 总冠军（所有组中的最大值）

	// 逐组处理
	for i := 0; i < n; i++ {
		max := 0
		for j := 0; j < m; j++ {
			var w int
			fmt.Fscan(in, &w)
			if w > max {
				max = w // 更新当前组最大值
			}
		}
		champs[i] = max
		if max > overall {
			overall = max // 更新总冠军
		}
	}

	// 输出各组冠军
	for i, c := range champs {
		if i > 0 {
			out.WriteByte(' ')
		}
		fmt.Fprint(out, c)
	}
	out.WriteByte('\n')

	// 输出总冠军
	fmt.Fprintln(out, overall)
}