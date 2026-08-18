// 题目：1019 数字黑洞
// 实现原理：给定一个 4 位正整数（不足 4 位补前导 0），将其各位数字按降序和升序
// 重新排列得到两个新数，相减得到差。重复此过程，直到差为 6174 或 0。
// 若各位数字全相同，则直接输出减式为 0000。

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

// main 是程序入口函数，读取一个 4 位正整数并模拟数字黑洞过程。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		return
	}
	n := strings.TrimSpace(scanner.Text())
	for {
		digits := []byte(n)
		// 补足 4 位
		for len(digits) < 4 {
			digits = append([]byte{'0'}, digits...)
		}
		// 检查是否各位数字全相同
		allSame := true
		for i := 1; i < 4; i++ {
			if digits[i] != digits[0] {
				allSame = false
				break
			}
		}
		if allSame {
			fmt.Printf("%s - %s = 0000\n", string(digits), string(digits))
			return
		}
		// 降序排列
		desc := make([]byte, 4)
		copy(desc, digits)
		sort.Slice(desc, func(i, j int) bool { return desc[i] > desc[j] })
		// 升序排列
		asc := make([]byte, 4)
		copy(asc, digits)
		sort.Slice(asc, func(i, j int) bool { return asc[i] < asc[j] })
		// 计算差值
		a, _ := strconv.Atoi(string(desc))
		b, _ := strconv.Atoi(string(asc))
		diff := a - b
		fmt.Printf("%s - %s = %04d\n", string(desc), string(asc), diff)
		// 达到黑洞数 6174 则终止
		if diff == 6174 {
			return
		}
		n = fmt.Sprintf("%04d", diff)
	}
}