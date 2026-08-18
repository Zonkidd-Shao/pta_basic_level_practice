// 题目：1088 三人行
// 实现原理：甲是两位数（10~99），乙是甲的数字反转。已知：|甲 - 乙| / x = 丙，
// 且乙 = 丙 * y。从 99 往下枚举甲的取值，找到满足条件的最大甲。然后根据
// 甲、乙、丙的值与 M 的大小关系，分别输出 "Cong"（大于）、"Ping"（等于）
// 或 "Gai"（小于）。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口，读取 M、x、y，找出满足条件的甲并输出比较结果。
func main() {
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var m, x, y int
	fmt.Fscan(in, &m, &x, &y)

	// 甲: 2-digit number. 乙: digits reversed. 丙 = |甲-乙|/x, also 乙 = 丙*y.
	// So 乙 = |甲-乙|/x * y  =>  |甲-乙| = 乙*x/y. Need integer 丙.
	bestJia := -1
	bestYi := -1
	bestBing := -1
	found := false
	// 从大到小枚举甲，保证找到的是最大值
	for jia := 99; jia >= 10; jia-- {
		yi := (jia%10)*10 + jia/10 // 乙 = 甲的数字反转
		diff := jia - yi
		if diff < 0 {
			diff = -diff
		}
		// 丙 = diff / x must be integer, and yi == bing*y
		if x == 0 {
			continue
		}
		if diff%x != 0 { // 丙必须是整数
			continue
		}
		bing := diff / x
		if bing <= 0 {
			continue
		}
		if yi != bing*y { // 验证乙 = 丙 * y
			continue
		}
		bestJia = jia
		bestYi = yi
		bestBing = bing
		found = true
		break
	}
	if !found {
		fmt.Fprintln(out, "No Solution")
		return
	}
	// rel 比较 v 与 m 的大小关系，返回对应字符串
	rel := func(v int) string {
		if v > m {
			return "Cong"
		}
		if v == m {
			return "Ping"
		}
		return "Gai"
	}
	fmt.Fprintf(out, "%d %s %s %s\n", bestJia, rel(bestJia), rel(bestYi), rel(bestBing))
}