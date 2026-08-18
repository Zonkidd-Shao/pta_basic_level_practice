// 题目：1082 射击比赛
// 实现原理：读取 N 名选手的编号和射击坐标 (x, y)，计算每名选手到原点 (0,0) 的
// 距离平方（d = x² + y²），避免开平方以提高效率。遍历过程中记录距离最小（冠军）
// 和距离最大（菜鸟）的选手编号，最后输出。

package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口，读取输入并找出距原点最近和最远的选手编号并输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text())) // 读取选手人数
	bestID, worstID := "", ""
	bestDist, worstDist := math.MaxInt64, -1
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		id := f[0]
		x, _ := strconv.ParseFloat(f[1], 64)
		y, _ := strconv.ParseFloat(f[2], 64)
		d := int(x*x + y*y) // 计算到原点距离的平方（避免开方）
		// 更新最近距离
		if d < bestDist {
			bestDist = d
			bestID = id
		}
		// 更新最远距离
		if d > worstDist {
			worstDist = d
			worstID = id
		}
	}
	fmt.Printf("%s %s\n", bestID, worstID)
}