/*
题目：1051 复数乘法
实现原理：极坐标相乘时模长相乘、辐角相加，再用三角函数转为直角坐标输出。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"math"
	"strconv"
	"strings"
)

// 复数乘法：结果模长 r=r1*r2，辐角相加；小于 0.01 视为 0。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	r1, _ := strconv.ParseFloat(f[0], 64)
	p1, _ := strconv.ParseFloat(f[1], 64)
	r2, _ := strconv.ParseFloat(f[2], 64)
	p2, _ := strconv.ParseFloat(f[3], 64)
	r := r1 * r2
	A := r * math.Cos(p1+p2)
	B := r * math.Sin(p1+p2)
	if math.Abs(A) < 0.01 {
		A = 0
	}
	if math.Abs(B) < 0.01 {
		B = 0
	}
	if B < 0 {
		fmt.Printf("%.2f-%.2fi\n", A, -B)
	} else {
		fmt.Printf("%.2f+%.2fi\n", A, B)
	}
}
