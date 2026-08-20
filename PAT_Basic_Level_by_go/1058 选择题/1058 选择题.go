/*
 * 题目：1058 选择题
 * 每道题只有选择全部正确选项才能得分，并统计每道题答错的人数。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type question struct {
	score   int
	correct map[byte]bool
}

func parseAnswer(tokens []string, pos int) (map[byte]bool, int) {
	chosen := make(map[byte]bool)
	if pos >= len(tokens) {
		return chosen, pos
	}
	countText := strings.TrimPrefix(tokens[pos], "(")
	countText = strings.TrimSuffix(countText, ")")
	k, _ := strconv.Atoi(countText)
	for i := 0; i < k && pos+1+i < len(tokens); i++ {
		option := strings.TrimSuffix(tokens[pos+1+i], ")")
		if option != "" {
			chosen[option[0]] = true
		}
	}
	return chosen, pos + 1 + k
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 8*1024*1024), 8*1024*1024)
	if !scanner.Scan() {
		return
	}
	first := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(first[0])
	M, _ := strconv.Atoi(first[1])

	questions := make([]question, M)
	for i := 0; i < M; i++ {
		scanner.Scan()
		fields := strings.Fields(scanner.Text())
		score, _ := strconv.Atoi(fields[0])
		correct := make(map[byte]bool)
		for j := 3; j < len(fields); j++ {
			correct[fields[j][0]] = true
		}
		questions[i] = question{score: score, correct: correct}
	}

	scores := make([]int, N)
	wrong := make([]int, M)
	for student := 0; student < N; student++ {
		if !scanner.Scan() {
			break
		}
		tokens := strings.Fields(scanner.Text())
		pos := 0
		for i := 0; i < M; i++ {
			chosen, next := parseAnswer(tokens, pos)
			pos = next
			correct := len(chosen) == len(questions[i].correct)
			if correct {
				for option := range chosen {
					if !questions[i].correct[option] {
						correct = false
						break
					}
				}
			}
			if correct {
				scores[student] += questions[i].score
			} else {
				wrong[i]++
			}
		}
	}

	for _, score := range scores {
		fmt.Println(score)
	}
	maxWrong := 0
	for _, count := range wrong {
		if count > maxWrong {
			maxWrong = count
		}
	}
	if maxWrong == 0 {
		fmt.Println("Too simple")
		return
	}
	parts := make([]string, 0, M)
	for i, count := range wrong {
		if count == maxWrong {
			parts = append(parts, strconv.Itoa(i+1))
		}
	}
	fmt.Printf("%d %s\n", maxWrong, strings.Join(parts, " "))
}
