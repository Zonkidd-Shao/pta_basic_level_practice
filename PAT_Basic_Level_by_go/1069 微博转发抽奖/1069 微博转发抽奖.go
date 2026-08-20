/*
 * 题目：1069 微博转发抽奖
 * 解题思路：
 * 从第 S 位用户开始，每隔 M 位抽取一位中奖者。若某位用户已中奖，
 * 则顺延到其后的下一位（即跳过该位继续按间隔 M 查找）。如果无
 * 人符合中奖条件，输出 "Keep going..."。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口函数，处理微博转发抽奖流程。
func main() {
	in := bufio.NewReader(os.Stdin)
	var N, M, S int
	if _, err := fmt.Fscan(in, &N, &M, &S); err != nil {
		return
	}
	names := make([]string, N)
	for i := range names {
		fmt.Fscan(in, &names[i])
	}

	chosen := make(map[string]bool) // 记录已中奖者，避免重复
	winners := make([]string, 0)
	idx := S - 1 // 转换为 0 基索引

	// 从起始位置开始，每隔 M 位抽取
	for idx < N {
		// 若该用户已中奖，则顺延到下一位重新检查。
		if chosen[names[idx]] {
			idx++
			continue
		}
		winners = append(winners, names[idx])
		chosen[names[idx]] = true
		idx += M
	}

	// 输出结果
	if len(winners) == 0 {
		fmt.Println("Keep going...")
		return
	}
	for _, w := range winners {
		fmt.Println(w)
	}
}
