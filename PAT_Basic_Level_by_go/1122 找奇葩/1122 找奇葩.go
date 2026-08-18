/*
题目：1122 找奇葩

解题思路：
给定 N 个整数，找出"奇葩"——即出现次数为奇数的奇数。
利用异或运算的性质：a ^ a = 0，a ^ 0 = a。
对序列中所有奇数进行异或，出现偶数次的奇数会互相抵消，
最终结果即为出现奇数次的奇数。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)

	// 对序列中所有奇数进行异或运算
	result := 0
	for i := 0; i < n; i++ {
		var v int
		fmt.Fscan(in, &v)
		// 只对奇数做异或，偶数不影响结果
		if v%2 != 0 {
			result ^= v
		}
	}
	fmt.Fprintln(out, result)
}