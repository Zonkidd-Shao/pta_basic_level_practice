/*
 * 题目：1023 组个最小数
 * 实现原理：给定 0~9 每个数字的可用个数，要组成最小的整数。
 * 先将除 0 之外的最小数字放到最高位（不能前导零），然后将剩余数字按 0~9 升序依次拼接。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// 用给定数量的数字 0~9 组成最小的不含前导零的整数。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	cnt := make([]int, 10)
	for i := 0; i < 10; i++ {
		cnt[i], _ = strconv.Atoi(f[i])
	}
	var b strings.Builder
	// 先取一个非零的最小数字作为最高位
	for i := 1; i < 10; i++ {
		if cnt[i] > 0 {
			b.WriteString(strconv.Itoa(i))
			cnt[i]--
			break
		}
	}
	// 将剩余数字按 0~9 升序依次拼接到末尾
	for i := 0; i < 10; i++ {
		for cnt[i] > 0 {
			b.WriteString(strconv.Itoa(i))
			cnt[i]--
		}
	}
	fmt.Println(b.String())
}