/*
 * 题目：1070 结绳
 * 解题思路：
 * 每次取两根绳子对折（即长度相加后除以 2）连接成一根新绳。
 * 贪心策略：将绳子按长度升序排序，先连接最短的绳子，这样
 * 能保证最终得到的绳子长度最大。因为每次对折都会损失长度，
 * 让长绳少参与对折可减少损失。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

// main 是程序入口函数，计算最大结绳长度。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0]) // 绳子数量

	// 读取所有绳子长度
	scanner.Scan()
	lens := strings.Fields(scanner.Text())
	a := make([]int, N)
	for i := 0; i < N; i++ {
		a[i], _ = strconv.Atoi(lens[i])
	}

	// 升序排序，贪心策略：短绳先对折
	sort.Ints(a)
	res := a[0] // 从最短的绳子开始
	// 依次对折连接：每次 (当前长度 + 下一根长度) / 2
	for i := 1; i < N; i++ {
		res = (res + a[i]) / 2
	}

	// 输出最终长度（整数）
	fmt.Println(res)
}