/*
题目：1052 卖个萌
实现原理：解析三类方括号中的表情部件；每个请求先检查下标范围，合法时按固定模板拼接。
*/
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func parseLine(s string) []string {
	tokens := strings.Fields(s)
	res := make([]string, 0, len(tokens))
	for _, t := range tokens {
		res = append(res, t[1:len(t)-1])
	}
	return res
}

// 卖个萌：根据手、眼、口符号组合表情。
func main() {
	in := bufio.NewReader(os.Stdin)
	readLine := func() string {
		s, _ := in.ReadString('\n')
		for len(s) > 0 && (s[len(s)-1] == '\n' || s[len(s)-1] == '\r') {
			s = s[:len(s)-1]
		}
		return s
	}
	hand := parseLine(readLine())
	eye := parseLine(readLine())
	mouth := parseLine(readLine())
	K, _ := strconv.Atoi(readLine())
	var b strings.Builder
	for i := 0; i < K; i++ {
		f := strings.Fields(readLine())
		lh, _ := strconv.Atoi(f[0])
		le, _ := strconv.Atoi(f[1])
		mo, _ := strconv.Atoi(f[2])
		re, _ := strconv.Atoi(f[3])
		rh, _ := strconv.Atoi(f[4])
		if lh < 1 || lh > len(hand) || le < 1 || le > len(eye) || mo < 1 || mo > len(mouth) || re < 1 || re > len(eye) || rh < 1 || rh > len(hand) {
			b.WriteString("Are you kidding me? @\\/@\n")
			continue
		}
		b.WriteString(fmt.Sprintf("[%s]([%s][%s][%s])[%s]\n",
			hand[lh-1], eye[le-1], mouth[mo-1], eye[re-1], hand[rh-1]))
	}
	fmt.Print(b.String())
}
