/*
 * 题目：1073 多选题常见计分法
 * 解题思路：
 * 先读取每道多选题的分值、选项数量和正确选项。对于每位学生的作答，
 * 按如下规则计分：
 *   1) 全选对（且无多余选项）得满分；
 *   2) 只选了部分正确选项（无错误选项）得半份；
 *   3) 其余情况（选了错误选项或漏选且选了错选）得 0 分。
 * 同时统计每题每个选项被选错（漏选或错选）的次数，最后输出
 * 错得最多的选项信息（按错误次数降序、题号升序、选项字母升序）。
 * 若无任何错误，输出 "Too simple"。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

// main 是程序入口函数，批改多选题并统计错选情况。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 8*1024*1024), 8*1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0]) // 学生人数
	M, _ := strconv.Atoi(f[1]) // 题目数量

	// 题目结构：分值和正确选项集合
	type q struct {
		score   int
		options int
		correct map[byte]bool
	}
	qs := make([]q, M)
	wrongOpt := make([][]int, M) // 每题各选项的错误次数，索引 0~4 对应 a~e

	// 读取每道题的配置
	for i := 0; i < M; i++ {
		if !scanner.Scan() {
			break
		}
		fl := strings.Fields(scanner.Text())
		score, _ := strconv.Atoi(fl[0]) // 分值
		correct := make(map[byte]bool)
		for j := 3; j < len(fl); j++ { // 从第 4 项开始为正确选项字母
			correct[fl[j][0]] = true
		}
		options, _ := strconv.Atoi(fl[1])
		qs[i] = q{score: score, options: options, correct: correct}
		wrongOpt[i] = make([]int, 5) // 初始化选项错误计数器
	}

	scores := make([]float64, N)
	// 批改每位学生的答题卡
	for s := 0; s < N; s++ {
		if !scanner.Scan() {
			break
		}
		tokens := strings.Fields(scanner.Text())
		ti := 0 // token 索引
		for qi := 0; qi < M; qi++ {
			// 解析该题的作答选项
			countToken := strings.TrimPrefix(tokens[ti], "(")
			countToken = strings.TrimSuffix(countToken, ")")
			k, _ := strconv.Atoi(countToken) // 选择的选项个数
			chosen := make(map[byte]bool)
			for j := 0; j < k; j++ {
				option := strings.TrimSuffix(tokens[ti+1+j], ")")
				chosen[option[0]] = true
			}
			ti += 1 + k // 移到下一题的 token 位置

			// 统计每个选项的错选情况（漏选或错选均计为错误）
			for opt := byte('a'); opt < byte('a'+qs[qi].options); opt++ {
				if chosen[opt] != qs[qi].correct[opt] {
					wrongOpt[qi][opt-'a']++
				}
			}

			// 计分逻辑
			if len(chosen) == len(qs[qi].correct) {
				// 检查是否完全匹配（不多不少）
				allMatch := true
				for c := range chosen {
					if !qs[qi].correct[c] {
						allMatch = false
						break
					}
				}
				if allMatch {
					scores[s] += float64(qs[qi].score) // 满分
					continue
				}
			}
			// 检查是否只选了正确选项的子集（无错误选项） -> 半份
			subset := true
			for c := range chosen {
				if !qs[qi].correct[c] {
					subset = false
					break
				}
			}
			if subset {
				scores[s] += float64(qs[qi].score) / 2 // 半份
			}
			// 否则得 0 分
		}
	}

	// 输出每位学生的得分（保留一位小数）
	for _, sc := range scores {
		fmt.Printf("%.1f\n", float64(sc))
	}

	// 收集所有错误信息，找出最大错误次数
	type wrongInfo struct {
		q, opt, cnt int // 题号、选项索引、错误次数
	}
	infos := make([]wrongInfo, 0)
	maxWrong := 0
	for qi := 0; qi < M; qi++ {
		for opt := 0; opt < 5; opt++ {
			if wrongOpt[qi][opt] > 0 {
				infos = append(infos, wrongInfo{qi, opt, wrongOpt[qi][opt]})
				if wrongOpt[qi][opt] > maxWrong {
					maxWrong = wrongOpt[qi][opt]
				}
			}
		}
	}

	// 若没有错误选项，输出 "Too simple"
	if maxWrong == 0 {
		fmt.Println("Too simple")
		return
	}

	// 排序：错误次数降序 -> 题号升序 -> 选项字母升序
	sort.Slice(infos, func(i, j int) bool {
		if infos[i].cnt != infos[j].cnt {
			return infos[i].cnt > infos[j].cnt
		}
		if infos[i].q != infos[j].q {
			return infos[i].q < infos[j].q
		}
		return infos[i].opt < infos[j].opt
	})

	// 输出所有错误次数达到最大值的选项
	for _, info := range infos {
		if info.cnt != maxWrong {
			break
		}
		fmt.Printf("%d %d-%c\n", info.cnt, info.q+1, 'a'+info.opt)
	}
}
