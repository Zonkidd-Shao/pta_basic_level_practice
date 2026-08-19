/*
题目：1046 划拳
实现原理：每轮计算两人喊出的数字之和；仅一方手势等于该和时，另一方喝酒。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 划拳：统计甲乙各自喝酒的杯数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	aDrink, bDrink := 0, 0
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		aShout, _ := strconv.Atoi(f[0])
		aHand, _ := strconv.Atoi(f[1])
		bShout, _ := strconv.Atoi(f[2])
		bHand, _ := strconv.Atoi(f[3])
		sum := aShout + bShout
		if aHand == sum && bHand != sum {
			bDrink++
		} else if bHand == sum && aHand != sum {
			aDrink++
		}
	}
	fmt.Printf("%d %d\n", aDrink, bDrink)
}
