/*
题目：1037 在霍格沃茨找零钱
实现原理：统一换算为 Knut 后相减，再按 493 和 29 的进制关系还原为三档货币。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 在霍格沃茨找零钱：以 Galleon.Sickle.Knut 计算找零。
func parse(s string) int64 {
	f := strings.Split(s, ".")
	g, _ := strconv.ParseInt(f[0], 10, 64)
	sick, _ := strconv.ParseInt(f[1], 10, 64)
	knut, _ := strconv.ParseInt(f[2], 10, 64)
	return g*493 + sick*29 + knut
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	P := parse(f[0])
	A := parse(f[1])
	diff := A - P
	neg := false
	if diff < 0 {
		neg = true
		diff = -diff
	}
	g := diff / 493
	diff %= 493
	sick := diff / 29
	knut := diff % 29
	if neg {
		fmt.Printf("-%d.%d.%d\n", g, sick, knut)
	} else {
		fmt.Printf("%d.%d.%d\n", g, sick, knut)
	}
}
