// 题目：1002 写出这个数
// 实现原理：读入一个自然数 n，计算其各位数字之和，然后将和的每一位用汉语拼音
// 逐位输出。先将数字字符串逐位累加求和，再将和的各位数字提取出来，查拼音表输出。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// pinyin 是数字 0~9 对应的汉语拼音映射表
var pinyin = []string{"ling", "yi", "er", "san", "si", "wu", "liu", "qi", "ba", "jiu"}

// main 是程序入口函数，读取输入的数字字符串，计算各位之和并以拼音输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	s := strings.TrimSpace(scanner.Text())
	sum := 0
	// 逐位累加各位数字之和
	for _, c := range s {
		sum += int(c - '0')
	}
	// 提取 sum 的每一位数字，存入切片
	digits := []int{}
	for sum > 0 {
		digits = append([]int{sum % 10}, digits...)
		sum /= 10
	}
	// 和为 0 的特殊情况
	if len(digits) == 0 {
		digits = []int{0}
	}
	// 逐位输出拼音，以空格分隔
	var b strings.Builder
	for i, d := range digits {
		if i > 0 {
			b.WriteByte(' ')
		}
		b.WriteString(pinyin[d])
	}
	fmt.Println(b.String())
}