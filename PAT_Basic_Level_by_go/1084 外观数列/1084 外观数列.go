// 题目：1084 外观数列
// 实现原理：外观数列的规律是「读前一个数字串，将连续相同数字的个数和数字本身交替记录」。
// 给定初始数字 D 和迭代次数 N，循环调用 next() 函数生成下一项：遍历字符串，对每段连续
// 相同字符记录其个数和该字符，拼接成新字符串。最终输出第 N 项。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// next 根据外观数列规则，生成字符串 s 的下一项。
// 遍历 s，对每段连续相同字符，追加其个数和该字符到结果中。
func next(s string) string {
	var b strings.Builder
	i := 0
	for i < len(s) {
		c := s[i]
		cnt := 1
		// 统计连续相同字符的个数
		for i+cnt < len(s) && s[i+cnt] == c {
			cnt++
		}
		// 写入字符本身和出现次数
		b.WriteByte(c)
		b.WriteString(strconv.Itoa(cnt))
		i += cnt
	}
	return b.String()
}

// main 是程序入口，读取初始数字 D 和迭代次数 N，输出外观数列的第 N 项。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	D := f[0]
	N, _ := strconv.Atoi(f[1])
	// 从第 1 项开始迭代，生成第 N 项
	for i := 1; i < N; i++ {
		D = next(D)
	}
	fmt.Println(D)
}
