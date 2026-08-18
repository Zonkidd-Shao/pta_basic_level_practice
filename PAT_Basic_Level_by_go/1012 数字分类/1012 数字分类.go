// 题目：1012 数字分类
// 实现原理：对给定正整数序列按模 5 的余数分为 5 类，分别计算：
// A1 = 能被 5 整除的偶数之和
// A2 = 余 1 的数交错求和（加、减、加、减……）
// A3 = 余 2 的数的个数
// A4 = 余 3 的数的平均值（保留一位小数）
// A5 = 余 4 的数的最大值

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取数字序列并输出分类统计结果。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	fields := strings.Fields(scanner.Text())
	a1, a2, a3, a5 := 0, 0, 0, 0
	a2sign := 1       // 交错求和的符号，1 为加，-1 为减
	a2exists := false // 标记是否存在余 1 的数
	a5exists := false // 标记是否存在余 4 的数
	a4sum, a4cnt := 0, 0

	// 遍历每个数字进行分类统计
	for _, f := range fields[1:] {
		v, _ := strconv.Atoi(f)
		switch v % 5 {
		case 0:
			// A1：能被 5 整除的偶数
			if v%2 == 0 {
				a1 += v
			}
		case 1:
			// A2：交错求和
			a2 += a2sign * v
			a2sign *= -1
			a2exists = true
		case 2:
			// A3：统计个数
			a3++
		case 3:
			// A4：累加和与计数，用于计算平均值
			a4sum += v
			a4cnt++
		case 4:
			// A5：取最大值
			a5exists = true
			if v > a5 {
				a5 = v
			}
		}
	}

	// 构建输出结果，不存在则输出 N
	out := make([]string, 0, 5)
	if a1 == 0 {
		out = append(out, "N")
	} else {
		out = append(out, strconv.Itoa(a1))
	}
	if !a2exists {
		out = append(out, "N")
	} else {
		out = append(out, strconv.Itoa(a2))
	}
	if a3 == 0 {
		out = append(out, "N")
	} else {
		out = append(out, strconv.Itoa(a3))
	}
	if a4cnt == 0 {
		out = append(out, "N")
	} else {
		out = append(out, fmt.Sprintf("%.1f", float64(a4sum)/float64(a4cnt)))
	}
	if !a5exists {
		out = append(out, "N")
	} else {
		out = append(out, strconv.Itoa(a5))
	}
	fmt.Println(strings.Join(out, " "))
}