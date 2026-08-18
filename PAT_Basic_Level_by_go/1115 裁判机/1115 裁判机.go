/*
题目：1115 裁判机

解题思路：
游戏规则：初始给出两个已出现的数字，N 个玩家进行 M 轮游戏。
每轮每个玩家提交一个数字，该数字必须满足：
  1. 之前未出现过
  2. 是某两个已出现数字之差
如果不满足则玩家出局。最后输出每轮出局的玩家和最终获胜者。
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

	// 读取两个初始数字
	var init1, init2 int
	fmt.Fscan(in, &init1, &init2)
	var n, m int
	fmt.Fscan(in, &n, &m)

	// 读取所有玩家的数字提交矩阵
	players := make([][]int, n+1)
	for i := 1; i <= n; i++ {
		players[i] = make([]int, m)
		for j := 0; j < m; j++ {
			fmt.Fscan(in, &players[i][j])
		}
	}

	// 记录已出现过的数字和玩家出局状态
	appeared := make(map[int]bool)
	appeared[init1] = true
	appeared[init2] = true
	outPlayer := make([]bool, n+1)

	// 逐轮处理
	for r := 0; r < m; r++ {
		var outThisRound []int
		for i := 1; i <= n; i++ {
			if outPlayer[i] {
				continue // 已出局的玩家跳过
			}
			num := players[i][r]

			// 条件1：数字之前不能出现过
			valid := !appeared[num]
			if valid {
				// 条件2：数字必须是已出现的某两个数之差
				found := false
				for x := range appeared {
					if num > x {
						if appeared[x+num] {
							found = true
							break
						}
					} else if x > num {
						if appeared[x-num] {
							found = true
							break
						}
					}
				}
				valid = found
			}

			if !valid {
				outPlayer[i] = true
				outThisRound = append(outThisRound, i)
			} else {
				appeared[num] = true // 标记该数字已出现
			}
		}
		// 输出本轮出局的玩家
		for _, i := range outThisRound {
			fmt.Fprintf(out, "Round #%d: %d is out.\n", r+1, i)
		}
	}

	// 统计未出局的获胜者
	var winners []int
	for i := 1; i <= n; i++ {
		if !outPlayer[i] {
			winners = append(winners, i)
		}
	}
	if len(winners) == 0 {
		fmt.Fprintln(out, "No winner.")
	} else {
		fmt.Fprint(out, "Winner(s):")
		for _, w := range winners {
			fmt.Fprintf(out, " %d", w)
		}
		out.WriteByte('\n')
	}
}