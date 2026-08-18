/*
题目：1109 擅长C

解题思路：
给定 26 个大写英文字母的 7×5 矩阵表示（用 . 和 * 表示），
以及一个包含大小写字母和其他字符的句子。
从句子中提取所有由连续大写字母组成的"单词"，
并用字母矩阵将每个单词逐行渲染输出，单词之间用空行分隔。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	// 读取 26 个字母，每个 7x5 的矩阵
	var matrices [26][7][5]byte
	for i := 0; i < 26; i++ {
		for r := 0; r < 7; r++ {
			line, err := in.ReadString('\n')
			if err != nil {
				break
			}
			// 去掉行尾换行符
			for len(line) > 0 && (line[len(line)-1] == '\n' || line[len(line)-1] == '\r') {
				line = line[:len(line)-1]
			}
			for c := 0; c < 5 && c < len(line); c++ {
				matrices[i][r][c] = line[c]
			}
		}
	}

	// 读取句子
	sentence, _ := in.ReadString('\n')
	for len(sentence) > 0 && (sentence[len(sentence)-1] == '\n' || sentence[len(sentence)-1] == '\r') {
		sentence = sentence[:len(sentence)-1]
	}

	// 提取单词：连续的大写字母序列
	var words []string
	cur := ""
	for _, ch := range sentence {
		if ch >= 'A' && ch <= 'Z' {
			cur += string(ch)
		} else {
			if cur != "" {
				words = append(words, cur)
				cur = ""
			}
		}
	}
	if cur != "" {
		words = append(words, cur)
	}

	// 逐单词渲染输出
	for wi, word := range words {
		if wi > 0 {
			out.WriteByte('\n') // 单词间空行分隔
		}
		// 逐行输出 7 行
		for r := 0; r < 7; r++ {
			for ci, ch := range word {
				if ci > 0 {
					out.WriteByte(' ') // 字母间空格分隔
				}
				idx := ch - 'A'
				out.Write(matrices[idx][r][:]) // 输出该字母当前行的 5 个字符
			}
			out.WriteByte('\n')
		}
	}
}