// 题目：1014 福尔摩斯的约会
// 实现原理：根据四行字符串中的字符匹配来解码约会信息。
// 前两行：第一对相同的大写字母（A~G）确定星期，第二对相同字符（数字 0~9 或 A~N）确定小时。
// 后两行：第一对相同的英文字母（不区分大小写）的位置确定分钟。

package main

import (
	"bufio"
	"fmt"
	"os"
)

// main 是程序入口函数，读取四行字符串并解码输出星期、小时、分钟。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	lines := make([]string, 4)
	for i := 0; i < 4; i++ {
		if !scanner.Scan() {
			return
		}
		lines[i] = scanner.Text()
	}
	days := []string{"MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"}

	// 第一对匹配的大写字母决定星期（A~G 对应星期一~星期日）
	day, dayPos := -1, -1
	for i := 0; i < len(lines[0]) && i < len(lines[1]); i++ {
		a, b := lines[0][i], lines[1][i]
		if a == b && a >= 'A' && a <= 'Z' {
			day = int(a - 'A')
			dayPos = i
			break
		}
	}
	// 从 day 位置之后开始，第二对匹配的字符决定小时
	hour := -1
	for i := dayPos + 1; i < len(lines[0]) && i < len(lines[1]); i++ {
		a, b := lines[0][i], lines[1][i]
		if a == b {
			if a >= '0' && a <= '9' {
				hour = int(a - '0')
				break
			}
			if a >= 'A' && a <= 'N' {
				hour = 10 + int(a-'A')
				break
			}
		}
	}
	// 后两行：第一对相同的英文字母（大小写均可）的位置决定分钟
	minute := -1
	for i := 0; i < len(lines[2]) && i < len(lines[3]); i++ {
		a, b := lines[2][i], lines[3][i]
		if a == b && ((a >= 'A' && a <= 'Z') || (a >= 'a' && a <= 'z')) {
			minute = i
			break
		}
	}
	fmt.Printf("%s %02d:%02d\n", days[day], hour, minute)
}
