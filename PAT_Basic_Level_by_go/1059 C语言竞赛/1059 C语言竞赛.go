/*
题目：1059 C语言竞赛
实现原理：记录各 ID 的排名和是否查询过；按首次、排名第一、ID 是否为素数的规则输出奖项。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func isPrime(n int) bool {
	if n < 2 {
		return false
	}
	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
			return false
		}
	}
	return true
}

// C语言竞赛：根据排名与 ID 性质输出对应奖项。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	N, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	rank := make(map[int]int)
	inList := make(map[int]bool)
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		id, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
		rank[id] = i + 1
		inList[id] = true
	}
	scanner.Scan()
	K, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
	checked := make(map[int]bool)
	for i := 0; i < K; i++ {
		if !scanner.Scan() {
			break
		}
		id, _ := strconv.Atoi(strings.TrimSpace(scanner.Text()))
		if !inList[id] {
			fmt.Printf("%d: Are you kidding?\n", id)
		} else if checked[id] {
			fmt.Printf("%d: Checked\n", id)
		} else {
			checked[id] = true
			if rank[id] == 1 {
				fmt.Printf("%d: Mystery Award\n", id)
			} else if isPrime(id) {
				fmt.Printf("%d: Minion\n", id)
			} else {
				fmt.Printf("%d: Champion\n", id)
			}
		}
	}
}
