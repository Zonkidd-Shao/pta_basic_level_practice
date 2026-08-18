/*
题目：1058 选择题
实现原理：每题以集合保存正确选项；学生选项集合与之相等得全分、为真子集得半分，其余为零。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 选择题：完全正确得满分，仅选中正确选项（子集）得一半分，否则 0 分。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 8*1024*1024), 8*1024*1024)
	if !scanner.Scan() {
		return
	}
	first := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(first[0])
	M, _ := strconv.Atoi(first[1])
	type q struct {
		score  int
		correct map[byte]bool
	}
	qs := make([]q, M)
	for i := 0; i < M; i++ {
		if !scanner.Scan() {
			break
		}
		f := strings.Fields(scanner.Text())
		score, _ := strconv.Atoi(f[0])
		correct := make(map[byte]bool)
		for j := 3; j < len(f); j++ {
			correct[f[j][0]] = true
		}
		qs[i] = q{score: score, correct: correct}
	}
	scores := make([]int, N)
	for s := 0; s < N; s++ {
		if !scanner.Scan() {
			break
		}
		tokens := strings.Fields(scanner.Text())
		ti := 0
		for qi := 0; qi < M; qi++ {
			k, _ := strconv.Atoi(tokens[ti+1])
			chosen := make(map[byte]bool)
			for j := 0; j < k; j++ {
				chosen[tokens[ti+2+j][0]] = true
			}
			ti += 3 + k
			if len(chosen) == len(qs[qi].correct) {
				allMatch := true
				for c := range chosen {
					if !qs[qi].correct[c] {
						allMatch = false
						break
					}
				}
				if allMatch {
					scores[s] += qs[qi].score
					continue
				}
			}
			subset := true
			for c := range chosen {
				if !qs[qi].correct[c] {
					subset = false
					break
				}
			}
			if subset {
				scores[s] += qs[qi].score / 2
			}
		}
	}
	for _, sc := range scores {
		fmt.Println(sc)
	}
}
