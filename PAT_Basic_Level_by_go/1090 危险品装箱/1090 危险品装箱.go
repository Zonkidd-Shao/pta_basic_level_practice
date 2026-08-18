// 题目：1090 危险品装箱
// 实现原理：给定 N 对互斥物品（不能放在同一个集装箱中），然后检查 M 个集装箱
// 的物品清单。对每个清单，使用哈希集合记录所有物品，然后遍历每件物品，检查其
// 互斥物品是否也在集合中。若存在互斥物品在同一箱中，则输出 "No"，否则输出 "Yes"。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取互斥关系和装箱清单，逐一检查每个箱子是否合规。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n, m int
	fmt.Fscan(in, &n, &m)

	// incompat[a] = list of items incompatible with a
	incompat := make(map[int][]int) // 互斥关系表
	for i := 0; i < n; i++ {
		var a, b int
		fmt.Fscan(in, &a, &b)
		// 互斥关系是双向的
		incompat[a] = append(incompat[a], b)
		incompat[b] = append(incompat[b], a)
	}

	for i := 0; i < m; i++ {
		var k int
		fmt.Fscan(in, &k)
		items := make([]int, k)
		for j := 0; j < k; j++ {
			fmt.Fscan(in, &items[j])
		}
		// 将当前箱中所有物品加入哈希集合
		present := make(map[int]bool, k)
		for _, it := range items {
			present[it] = true
		}
		ok := true
		// 检查每件物品是否有互斥物品在同一箱中
		for _, it := range items {
			for _, bad := range incompat[it] {
				if present[bad] { // 发现互斥物品
					ok = false
					break
				}
			}
			if !ok {
				break
			}
		}
		if ok {
			fmt.Fprintln(out, "Yes")
		} else {
			fmt.Fprintln(out, "No")
		}
	}
}