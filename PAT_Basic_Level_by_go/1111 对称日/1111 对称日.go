/*
题目：1111 对称日

解题思路：
给定一组日期（格式如 "Mon DD, YYYY"），判断每个日期在格式化为
YYYYMMDD 后是否为回文串（对称日）。
使用月份缩写映射表将英文月份转为数字，再用 sprintf 格式化日期，
最后判断字符串是否与其反转相等。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

// monthMap 将英文月份缩写映射为数字
var monthMap = map[string]int{
	"Jan": 1, "Feb": 2, "Mar": 3, "Apr": 4, "May": 5, "Jun": 6,
	"Jul": 7, "Aug": 8, "Sep": 9, "Oct": 10, "Nov": 11, "Dec": 12,
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)
	for i := 0; i < n; i++ {
		var mon, comma string
		var day, year int
		fmt.Fscan(in, &mon, &day, &comma, &year)

		// 将日期格式化为 YYYYMMDD 的字符串
		m := monthMap[mon]
		date := fmt.Sprintf("%04d%02d%02d", year, m, day)

		// 判断是否为回文
		rev := reverseStr(date)
		if date == rev {
			fmt.Fprintf(out, "Y %s\n", date)
		} else {
			fmt.Fprintf(out, "N %s\n", date)
		}
	}
}

// reverseStr 返回字符串 s 的反转
func reverseStr(s string) string {
	b := []byte(s)
	for i, j := 0, len(b)-1; i < j; i, j = i+1, j-1 {
		b[i], b[j] = b[j], b[i]
	}
	return string(b)
}