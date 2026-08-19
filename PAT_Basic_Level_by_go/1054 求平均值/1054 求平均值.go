/*
题目：1054 求平均值
实现原理：先检查字符形式，再验证数值范围与精度；仅将合法数计入总和和数量，最后按数量分类输出。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func isValid(s string) bool {
	if strings.Count(s, ".") > 1 {
		return false
	}
	body := s
	if len(body) > 0 && (body[0] == '+' || body[0] == '-') {
		body = body[1:]
	}
	if body == "" {
		return false
	}
	for _, c := range body {
		if c != '.' && (c < '0' || c > '9') {
			return false
		}
	}
	return true
}

// 求平均值：仅统计合法且在 [-1000,1000] 内、最多两位小数的数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	nums := make([]string, 0, N)
	for len(nums) < N {
		if !scanner.Scan() {
			break
		}
		for _, t := range strings.Fields(scanner.Text()) {
			nums = append(nums, t)
		}
	}
	sum := 0.0
	cnt := 0
	for _, s := range nums {
		if !isValid(s) {
			continue
		}
		v, err := strconv.ParseFloat(s, 64)
		if err != nil || v < -1000 || v > 1000 {
			continue
		}
		sum += v
		cnt++
	}
	switch cnt {
	case 0:
		fmt.Println("The average of 0 numbers is Undefined")
	case 1:
		fmt.Printf("The average of 1 number is %.2f\n", sum)
	default:
		fmt.Printf("The average of %d numbers is %.2f\n", cnt, sum/float64(cnt))
	}
}
