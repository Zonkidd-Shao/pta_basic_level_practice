// 题目：1092 最好吃的月饼
// 实现原理：有 N 种月饼（编号 1..N），M 个城市的销售额数据。累加每种月饼的
// 总销售额，找出最大值，然后按编号递增顺序输出所有达到最大值的月饼编号。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取销售数据，计算并输出销量冠军的月饼编号。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n, m int
	fmt.Fscan(in, &n, &m)
	sales := make([]int, n) // 每种月饼的总销量
	for i := 0; i < m; i++ {
		for j := 0; j < n; j++ {
			var v int
			fmt.Fscan(in, &v)
			sales[j] += v // 累加各城市销量
		}
	}
	// 找出最大销量
	max := -1
	for _, v := range sales {
		if v > max {
			max = v
		}
	}
	fmt.Fprintln(out, max)
	// 输出所有达到最大销量的月饼编号（递增）
	first := true
	for i, v := range sales {
		if v == max {
			if !first {
				out.WriteByte(' ')
			}
			fmt.Fprint(out, i+1)
			first = false
		}
	}
	out.WriteByte('\n')
}