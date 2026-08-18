/*
题目：1056 组合数的和
实现原理：每个数字在十位和个位各出现 N-1 次，因此所有两位组合和为 11×数字总和×(N-1)。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 组合数的和：所有两位组合之和等于 11 * 总和 * (N-1)。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	sum := 0
	for _, s := range f[1:] {
		v, _ := strconv.Atoi(s)
		sum += v
	}
	fmt.Println(11 * sum * (N - 1))
}
