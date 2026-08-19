/*
题目：1053 住房空置率
实现原理：统计每户低于阈值的天数；超过一半为可能空置，其中居住天数超过 D 的为确定空置。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 住房空置率：统计可能空置与确定空置的比例。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	e, _ := strconv.ParseFloat(f[1], 64)
	D, _ := strconv.Atoi(f[2])
	maybeCnt, vacantCnt := 0, 0
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		f2 := strings.Fields(scanner.Text())
		K, _ := strconv.Atoi(f2[0])
		below := 0
		for j := 1; j <= K; j++ {
			v, _ := strconv.ParseFloat(f2[j], 64)
			if v < e {
				below++
			}
		}
		if below > K/2 {
			maybeCnt++
			if K > D {
				vacantCnt++
			}
		}
	}
	maybeRate := float64(maybeCnt) / float64(N) * 100
	vacantRate := float64(vacantCnt) / float64(N) * 100
	fmt.Printf("%.1f%% %.1f%%\n", maybeRate, vacantRate)
}
