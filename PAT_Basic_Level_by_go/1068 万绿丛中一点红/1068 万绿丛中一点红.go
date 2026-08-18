/*
 * 题目：1068 万绿丛中一点红
 * 解题思路：
 * 首先统计每个像素值出现的次数，确保"独一无二"（只出现一次）。
 * 再遍历所有像素点，检查其与八邻域像素的差值绝对值是否均大于
 * 给定阈值 TOL（边界点只检查存在的邻域）。若恰好只有一个像素
 * 满足所有条件，则输出其坐标和值；否则输出 "Not Exist"。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// abs 返回整数 x 的绝对值。
func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

// main 是程序入口函数，查找"万绿丛中一点红"。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	M, _ := strconv.Atoi(f[0])   // 列数（宽度）
	N, _ := strconv.Atoi(f[1])   // 行数（高度）
	TOL, _ := strconv.Atoi(f[2]) // 颜色差阈值

	// 读取图像像素矩阵
	img := make([][]int, N)
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		pixels := strings.Fields(scanner.Text())
		img[i] = make([]int, M)
		for j := 0; j < M; j++ {
			img[i][j], _ = strconv.Atoi(pixels[j])
		}
	}

	// 统计每个像素值出现的次数
	count := make(map[int]int)
	for i := 0; i < N; i++ {
		for j := 0; j < M; j++ {
			count[img[i][j]]++
		}
	}

	type pt struct{ x, y, v int }
	var result []pt
	// 遍历所有像素点
	for i := 0; i < N; i++ {
		for j := 0; j < M; j++ {
			v := img[i][j]
			// 必须只出现一次（独一无二）
			if count[v] != 1 {
				continue
			}
			ok := true
			// 检查八邻域，判断差值是否均大于阈值
			for di := -1; di <= 1; di++ {
				for dj := -1; dj <= 1; dj++ {
					if di == 0 && dj == 0 {
						continue
					}
					ni, nj := i+di, j+dj
					if ni >= 0 && ni < N && nj >= 0 && nj < M {
						if abs(img[ni][nj]-v) <= TOL {
							ok = false
						}
					}
				}
			}
			if ok {
				result = append(result, pt{x: j + 1, y: i + 1, v: v})
			}
		}
	}

	// 根据结果数量输出
	if len(result) != 1 {
		fmt.Println("Not Exist")
	} else {
		fmt.Printf("(%d, %d): %d\n", result[0].x, result[0].y, result[0].v)
	}
}