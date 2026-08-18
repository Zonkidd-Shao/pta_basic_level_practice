/*
题目：1119 胖达与盆盆奶

解题思路：
N 只大熊猫排成一排，已知每只的体重。需要分配盆盆奶，规则如下：
  1. 每只熊猫至少 200ml
  2. 如果一只熊猫比相邻的体重更大，则必须比该邻居多得至少 100ml
  3. 体重相等时，牛奶量也必须相等
采用两次遍历：先从左到右保证比左邻居重的条件，再从右到左保证比右邻居重的条件，
取两次遍历中的较大值，以满足所有约束。
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

	// 读取每只熊猫的体重
	w := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Fscan(in, &w[i])
	}

	// 初始化每只熊猫的牛奶量，均为 200ml
	milk := make([]int, n)
	for i := range milk {
		milk[i] = 200
	}

	// 从左到右遍历：保证比左邻居重的熊猫获得更多牛奶
	for i := 1; i < n; i++ {
		if w[i] > w[i-1] {
			milk[i] = milk[i-1] + 100
		} else if w[i] == w[i-1] {
			milk[i] = milk[i-1]
		} else {
			milk[i] = 200
		}
	}

	// 从右到左遍历：保证比右邻居重的熊猫获得更多牛奶
	for i := n - 2; i >= 0; i-- {
		if w[i] > w[i+1] {
			if milk[i] < milk[i+1]+100 {
				milk[i] = milk[i+1] + 100
			}
		} else if w[i] == w[i+1] {
			if milk[i] < milk[i+1] {
				milk[i] = milk[i+1]
			}
		}
	}

	// 计算总牛奶量
	total := 0
	for _, m := range milk {
		total += m
	}
	fmt.Fprintln(out, total)
}