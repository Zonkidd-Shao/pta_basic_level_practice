// 题目：1095 解码 PAT 准考证
// 实现原理：读取所有考生的准考证号和成绩，然后处理 M 条查询指令。
// 指令类型有 3 种：
// 1 - 查询指定考试等级的所有考生，按成绩降序、准考证号升序输出；
// 2 - 查询指定考场的考生人数和总分；
// 3 - 查询指定考试日期的各考场人数，按人数降序、考场号升序输出。
// 每条查询输出 "Case N: 指令" 前缀，若无数据则输出 "NA"。

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
)

// cand 表示一名考生的准考证号和成绩。
type cand struct {
	id    string
	score int
}

// main 是程序入口，读取考生数据和查询指令，依次处理并输出结果。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n, m int
	fmt.Fscan(in, &n, &m)
	cands := make([]cand, n)
	for i := 0; i < n; i++ {
		fmt.Fscan(in, &cands[i].id, &cands[i].score)
	}

	for q := 1; q <= m; q++ {
		var t, cmd string
		fmt.Fscan(in, &t, &cmd)
		fmt.Fprintf(out, "Case %d: %s %s\n", q, t, cmd)

		switch t {
		case "1":
			// 查询指定考试等级的考生，按成绩降序、准考证号升序排序
			var sel []cand
			for _, c := range cands {
				if string(c.id[0]) == cmd {
					sel = append(sel, c)
				}
			}
			if len(sel) == 0 {
				fmt.Fprintln(out, "NA")
				break
			}
			sort.Slice(sel, func(i, j int) bool {
				if sel[i].score != sel[j].score {
					return sel[i].score > sel[j].score
				}
				return sel[i].id < sel[j].id
			})
			for _, c := range sel {
				fmt.Fprintf(out, "%s %d\n", c.id, c.score)
			}
		case "2":
			// 查询指定考场的人数和总分
			cnt, total := 0, 0
			for _, c := range cands {
				if c.id[1:4] == cmd {
					cnt++
					total += c.score
				}
			}
			if cnt == 0 {
				fmt.Fprintln(out, "NA")
				break
			}
			fmt.Fprintf(out, "%d %d\n", cnt, total)
		case "3":
			// 查询指定考试日期的各考场人数
			roomCnt := make(map[string]int) // 考场号 -> 人数
			for _, c := range cands {
				if c.id[4:10] == cmd {
					roomCnt[c.id[1:4]]++ // 准考证号第 2~4 位为考场号
				}
			}
			if len(roomCnt) == 0 {
				fmt.Fprintln(out, "NA")
				break
			}
			type rc struct {
				room string
				cnt  int
			}
			list := make([]rc, 0, len(roomCnt))
			for r, c := range roomCnt {
				list = append(list, rc{r, c})
			}
			// 按人数降序、考场号升序排序
			sort.Slice(list, func(i, j int) bool {
				if list[i].cnt != list[j].cnt {
					return list[i].cnt > list[j].cnt
				}
				return list[i].room < list[j].room
			})
			for _, x := range list {
				fmt.Fprintf(out, "%s %d\n", x.room, x.cnt)
			}
		}
	}
}