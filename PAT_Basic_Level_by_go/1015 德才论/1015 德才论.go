// 题目：1015 德才论
// 实现原理：将考生按德分和才分分为四类（圣人、君子、愚人、小人），
// 每类内部按总分降序、德分降序、准考证号升序排序后输出。
// 分类规则：
//   1 类（圣人）：德 >= H 且才 >= H
//   2 类（君子）：德 >= H 且才 < H
//   3 类（愚人）：德 < H 且才 < H 且德 >= 才
//   4 类（小人）：德 >= L 且才 >= L 但不符合以上三类

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

// stu 结构体表示一名考生的信息
type stu struct {
	id    string
	de    int
	cai   int
	cat   int   // 类别：1~4
	total int   // 总分
}

// main 是程序入口函数，读取考生信息，分类排序后输出。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	L, _ := strconv.Atoi(f[1]) // 最低录取线
	H, _ := strconv.Atoi(f[2]) // 优秀线
	stus := make([]stu, 0)
	// 逐行读取考生信息
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		p := strings.Fields(scanner.Text())
		de, _ := strconv.Atoi(p[1])
		cai, _ := strconv.Atoi(p[2])
		// 德才有一项低于 L 则淘汰
		if de < L || cai < L {
			continue
		}
		// 确定类别
		var cat int
		switch {
		case de >= H && cai >= H:
			cat = 1 // 圣人
		case de >= H && cai < H:
			cat = 2 // 君子
		case de < H && cai < H && de >= cai:
			cat = 3 // 愚人
		default:
			cat = 4 // 小人
		}
		stus = append(stus, stu{id: p[0], de: de, cai: cai, cat: cat, total: de + cai})
	}
	// 按类别升序、总分降序、德分降序、准考证号升序排序
	sort.Slice(stus, func(i, j int) bool {
		if stus[i].cat != stus[j].cat {
			return stus[i].cat < stus[j].cat
		}
		if stus[i].total != stus[j].total {
			return stus[i].total > stus[j].total
		}
		if stus[i].de != stus[j].de {
			return stus[i].de > stus[j].de
		}
		return stus[i].id < stus[j].id
	})
	fmt.Println(len(stus))
	for _, s := range stus {
		fmt.Printf("%s %d %d\n", s.id, s.de, s.cai)
	}
}