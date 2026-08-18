/*
题目：1049 数列的片段和
实现原理：第 i 个元素会出现在 i×(N-i+1) 个连续片段中，据此直接计算其总贡献。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 数列的片段和：每个元素在 (i+1)*(N-i) 个片段中出现，累加求和。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	sum := 0.0
	for i := 1; i <= N; i++ {
		v, _ := strconv.ParseFloat(f[i], 64)
		sum += v * float64(i) * float64(N-i+1)
	}
	fmt.Printf("%.2f\n", sum)
}
