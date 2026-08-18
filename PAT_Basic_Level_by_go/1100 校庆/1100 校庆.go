// 题目：1100 校庆
// 实现原理：给定校友名单和校庆当天来宾名单，统计来宾中有多少校友。
// 如果有校友出席，输出校友人数和最年长的校友（身份证号第 7~14 位为出生日期，
// 数字越小年龄越大）；如果没有校友，输出 0 和所有来宾中最年长的那位。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取校友和来宾名单，输出校友人数及最年长者。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)
	alumni := make(map[string]bool, n) // 校友集合
	for i := 0; i < n; i++ {
		var id string
		fmt.Fscan(in, &id)
		alumni[id] = true
	}

	var m int
	fmt.Fscan(in, &m)
	attendees := make([]string, 0, m) // 来宾列表
	for i := 0; i < m; i++ {
		var id string
		fmt.Fscan(in, &id)
		attendees = append(attendees, id)
	}

	oldestAlumni := "" // 最年长校友的身份证号
	count := 0          // 校友人数
	for _, id := range attendees {
		if alumni[id] {
			count++
			// 身份证号 7~14 位为出生日期，字符串越小年龄越大
			if oldestAlumni == "" || id[6:14] < oldestAlumni[6:14] {
				oldestAlumni = id
			}
		}
	}
	if count > 0 {
		fmt.Fprintln(out, count)
		fmt.Fprintln(out, oldestAlumni)
		return
	}
	// 没有校友，输出最年长来宾
	oldest := attendees[0]
	for _, id := range attendees[1:] {
		if id[6:14] < oldest[6:14] {
			oldest = id
		}
	}
	fmt.Fprintln(out, 0)
	fmt.Fprintln(out, oldest)
}