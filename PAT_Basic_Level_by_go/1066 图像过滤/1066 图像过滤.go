/*
 * 题目：1066 图像过滤
 * 解题思路：
 * 逐行读取图像像素的灰度值，若值在区间 [A, B] 内则替换为指定值，
 * 其余保持不变，按原格式输出处理后的图像。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// main 是程序入口函数，完成图像过滤替换操作。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	M, _ := strconv.Atoi(f[0]) // 行数
	N, _ := strconv.Atoi(f[1]) // 列数
	A, _ := strconv.Atoi(f[2]) // 区间下限
	B, _ := strconv.Atoi(f[3]) // 区间上限
	val, _ := strconv.Atoi(f[4]) // 替换值

	// 逐行处理每个像素
	for i := 0; i < M; i++ {
		if !scanner.Scan() {
			break
		}
		pixels := strings.Fields(scanner.Text())
		var b strings.Builder
		for j, p := range pixels {
			v, _ := strconv.Atoi(p)
			// 若灰度值在 [A, B] 范围内，则替换为指定值
			if v >= A && v <= B {
				v = val
			}
			if j > 0 {
				b.WriteByte(' ')
			}
			b.WriteString(strconv.Itoa(v))
		}
		// 输出处理后的行
		fmt.Println(b.String())
	}
}