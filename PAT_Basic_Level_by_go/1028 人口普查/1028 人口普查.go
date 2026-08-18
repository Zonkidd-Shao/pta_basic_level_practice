/*
 * 题目：1028 人口普查
 * 实现原理：读取 N 个人的姓名和出生日期，只保留合法范围内（1814/09/06 ~ 2014/09/06）
 * 的日期，用字符串比较找出其中最年长（日期最小）和最年轻（日期最大）的人。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 人口普查：在合法日期范围内找出最年长与最年轻的人。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	low, high := "1814/09/06", "2014/09/06" // 合法日期范围
	oldest, youngest := "", ""
	oldestDate, youngestDate := "2014/09/07", "1814/09/05" // 初始值：最老取最大、最年轻取最小
	cnt := 0
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		if len(f) < 2 {
			continue
		}
		name, date := f[0], f[1]
		// 过滤不合法日期
		if date < low || date > high {
			continue
		}
		cnt++
		if date < oldestDate {
			oldestDate, oldest = date, name // 日期越小越年长
		}
		if date > youngestDate {
			youngestDate, youngest = date, name // 日期越大越年轻
		}
	}
	if cnt == 0 {
		fmt.Println(0)
		return
	}
	fmt.Printf("%d %s %s\n", cnt, oldest, youngest)
}