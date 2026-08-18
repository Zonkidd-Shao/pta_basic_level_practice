// 题目：1085 PAT 单位排行
// 实现原理：读取 N 条考生记录，每条包含准考证号、得分和所属学校。将学校名统一转为小写，
// 使用哈希表按学校汇总：分别累加 B（乙级）、A（甲级）、T（顶级）三类分数，并统计考生人数。
// 计算加权总分：乙级（score/1.5）+ 甲级（score）+ 顶级（score*1.5），取整后按总分降序、
// 人数升序、校名字典序排序。输出时处理并列排名（总分相同则排名相同）。

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
)

// school 表示一个学校及其汇总信息。
type school struct {
	name   string   // 学校名称（小写）
	bTotal float64  // 乙级总分
	aTotal float64  // 甲级总分
	tTotal float64  // 顶级总分
	count  int      // 考生人数
}

func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)
	schools := make(map[string]*school) // 校名 -> 学校信息
	for i := 0; i < n; i++ {
		var id string
		var score int
		var sc string
		fmt.Fscan(in, &id, &score, &sc)
		sc = strings.ToLower(sc) // 学校名不区分大小写，统一转为小写
		s, ok := schools[sc]
		if !ok {
			s = &school{name: sc}
			schools[sc] = s
		}
		s.count++
		// 按考试等级累加分数
		switch id[0] {
		case 'B':
			s.bTotal += float64(score)
		case 'A':
			s.aTotal += float64(score)
		case 'T':
			s.tTotal += float64(score)
		}
	}
	// 将 map 转为切片以便排序
	list := make([]school, 0, len(schools))
	for _, s := range schools {
		list = append(list, *s)
	}
	// 计算加权总分
	weight := func(s school) int {
		return int(s.bTotal/1.5 + s.aTotal + s.tTotal*1.5)
	}
	// 按总分降序、人数升序、校名字典序排序
	sort.Slice(list, func(i, j int) bool {
		wi, wj := weight(list[i]), weight(list[j])
		if wi != wj {
			return wi > wj
		}
		if list[i].count != list[j].count {
			return list[i].count < list[j].count
		}
		return list[i].name < list[j].name
	})
	fmt.Fprintln(out, len(list))
	prevW := -1
	rank := 0
	for i, s := range list {
		w := weight(s)
		// 若总分与前一名不同，则更新排名为实际序号
		if i == 0 || w != prevW {
			rank = i + 1
		}
		prevW = w
		fmt.Fprintf(out, "%d %s %d %d\n", rank, s.name, w, s.count)
	}
}