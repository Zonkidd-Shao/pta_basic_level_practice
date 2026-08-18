/*
 * 题目：1071 小赌怡情
 * 解题思路：
 * 玩家初始有 T 个筹码，进行 K 局游戏。每局游戏给定整数 n1、
 * 下注方向 b（0 表示小，1 表示大）、下注筹码 t 和整数 n2。
 * 若 b 为 0 且 n2 < n1，或 b 为 1 且 n2 > n1，则玩家获胜；
 * 赢则加注，输则减注。筹码不足时输出提示；筹码归零则游戏结束。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，处理小赌怡情的游戏流程。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	T, _ := strconv.Atoi(f[0]) // 初始筹码数
	K, _ := strconv.Atoi(f[1]) // 游戏局数

	// 逐局处理游戏
	for i := 0; i < K; i++ {
		if !scanner.Scan() {
			break
		}
		g := strings.Fields(scanner.Text())
		n1, _ := strconv.Atoi(g[0]) // 第一个整数
		b, _ := strconv.Atoi(g[1])  // 下注方向：0 小，1 大
		t, _ := strconv.Atoi(g[2])  // 下注筹码数
		n2, _ := strconv.Atoi(g[3]) // 第二个整数

		// 筹码不足，无法下注
		if t > T {
			fmt.Printf("Not enough tokens.  Total = %d.\n", T)
			continue
		}

		// 判断是否获胜
		win := (b == 0 && n2 < n1) || (b == 1 && n2 > n1)
		if win {
			T += t // 赢：增加筹码
			fmt.Printf("Win %d!  Total = %d.\n", t, T)
		} else {
			T -= t // 输：扣除筹码
			fmt.Printf("Lose %d.  Total = %d.\n", t, T)
			// 筹码归零，游戏结束
			if T == 0 {
				fmt.Println("Game Over.")
				return
			}
		}
	}
}