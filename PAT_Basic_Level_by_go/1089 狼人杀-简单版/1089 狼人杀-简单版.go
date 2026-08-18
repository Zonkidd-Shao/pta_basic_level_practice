// 题目：1089 狼人杀-简单版
// 实现原理：N 名玩家各说一句话，正数表示该玩家是好人，负数表示该玩家是狼人。
// 已知：有 2 个狼人，1 个狼人说谎，1 个好人说谎（共 2 人说谎）。
// 枚举所有可能的狼人组合（i, j），对每种组合验证说谎人数：统计每个人说的话
// 与实际身份是否矛盾，若恰好有 2 人说谎且其中 1 人是狼人，则找到解。
// 按字典序最小的组合输出。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取玩家发言，枚举狼人组合并输出结果。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)
	said := make([]int, n+1) // said[i] 表示玩家 i 的发言（1-indexed）
	for i := 1; i <= n; i++ {
		fmt.Fscan(in, &said[i])
	}

	// 枚举两只狼的所有可能组合
	for i := 1; i <= n; i++ {
		for j := i + 1; j <= n; j++ {
			// 标记狼人身份
			isWolf := make([]bool, n+1)
			isWolf[i] = true
			isWolf[j] = true
			liars := 0    // 总说谎人数
			wolfLiar := 0 // 说谎的狼人人数
			for k := 1; k <= n; k++ {
				claimedWolf := said[k] < 0 // 玩家 k 声称对方是狼人
				v := said[k]
				if v < 0 {
					v = -v
				}
				actualWolf := isWolf[v] // 玩家 v 的实际身份
				// 说谎：声称的身份与实际不符
				if claimedWolf != actualWolf {
					liars++
					if isWolf[k] {
						wolfLiar++
					}
				}
			}
			// 恰好 2 人说谎，且其中 1 人是狼人
			if liars == 2 && wolfLiar == 1 {
				fmt.Fprintf(out, "%d %d\n", i, j)
				return
			}
		}
	}
	fmt.Fprintln(out, "No Solution")
}