// 题目：1001 害死人不偿命的(3n+1)猜想
// 实现原理：对任意给定的正整数 n，如果是偶数则砍掉一半，如果是奇数则计算 (3n+1)/2，
// 如此反复，统计需要多少步才能得到 1。直接模拟递推过程即可。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取输入的正整数 n，模拟卡拉兹猜想过程并输出步数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	// 读取并解析正整数 n
	n, err := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	if err != nil {
		return
	}
	steps := 0
	// 一直计算直到 n 变为 1
	for n != 1 {
		if n%2 == 0 {
			n /= 2 // 偶数则除以 2
		} else {
			n = (3*n + 1) / 2 // 奇数则计算 (3n+1)/2
		}
		steps++
	}
	fmt.Println(steps)
}