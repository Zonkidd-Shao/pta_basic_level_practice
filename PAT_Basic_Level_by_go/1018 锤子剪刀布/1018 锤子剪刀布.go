// 题目：1018 锤子剪刀布
// 实现原理：统计两人在 N 轮猜拳中各自的胜、平、负次数，以及获胜时出的手势，
// 找出获胜次数最多的手势（按 B、C、J 优先级）。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取 N 轮猜拳记录并输出统计结果。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	n, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	aWin, bWin, draw := 0, 0, 0
	// 记录双方各手势的获胜次数
	aCnt := map[byte]int{'B': 0, 'C': 0, 'J': 0}
	bCnt := map[byte]int{'B': 0, 'C': 0, 'J': 0}

	// win 判断手势 p 是否能赢手势 q
	win := func(p, q byte) bool {
		return (p == 'B' && q == 'C') || (p == 'C' && q == 'J') || (p == 'J' && q == 'B')
	}

	// 逐轮统计
	for i := 0; i < n; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		x, y := f[0][0], f[1][0]
		if x == y {
			draw++
		} else if win(x, y) {
			aWin++
			aCnt[x]++
		} else {
			bWin++
			bCnt[y]++
		}
	}

	fmt.Printf("%d %d %d\n", aWin, draw, bWin)
	fmt.Printf("%d %d %d\n", bWin, draw, aWin)

	// best 找出获胜次数最多的手势，次数相同时按 B、C、J 优先级取第一个
	best := func(c map[byte]int) byte {
		order := []byte{'B', 'C', 'J'}
		mx, res := -1, byte('B')
		for _, g := range order {
			if c[g] > mx {
				mx, res = c[g], g
			}
		}
		return res
	}
	fmt.Printf("%c %c\n", best(aCnt), best(bCnt))
}
