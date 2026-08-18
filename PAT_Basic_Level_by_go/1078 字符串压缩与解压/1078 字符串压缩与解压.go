/*
 * 题目：1078 字符串压缩与解压
 * 解题思路：
 * 压缩（C）：将连续重复的字符替换为"重复次数+字符"（次数为 1 时不加数字）。
 * 解压（D）：将数字+字符还原为重复字符序列（数字表示重复次数）。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// compress 将字符串进行游程编码压缩。
func compress(s string) string {
	var b strings.Builder
	i := 0
	for i < len(s) {
		c := s[i]
		cnt := 1
		// 统计连续相同字符的个数
		for i+cnt < len(s) && s[i+cnt] == c {
			cnt++
		}
		// 若重复次数 > 1，先输出次数，再输出字符
		if cnt > 1 {
			b.WriteString(strconv.Itoa(cnt))
		}
		b.WriteByte(c)
		i += cnt
	}
	return b.String()
}

// decompress 将压缩后的字符串解压还原。
func decompress(s string) string {
	var b strings.Builder
	i := 0
	for i < len(s) {
		// 解析连续的数字作为重复次数
		num := 0
		for i < len(s) && s[i] >= '0' && s[i] <= '9' {
			num = num*10 + int(s[i]-'0')
			i++
		}
		// 若没有数字，表示只重复 1 次
		if num == 0 {
			num = 1
		}
		// 将当前字符重复 num 次输出
		if i < len(s) {
			for j := 0; j < num; j++ {
				b.WriteByte(s[i])
			}
			i++
		}
	}
	return b.String()
}

// main 是程序入口函数，根据模式选择压缩或解压。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	mode := strings.TrimSpace(scanner.Text()) // 模式：C 压缩，D 解压
	scanner.Scan()
	s := scanner.Text() // 待处理字符串
	if mode == "C" {
		fmt.Println(compress(s))
	} else {
		fmt.Println(decompress(s))
	}
}