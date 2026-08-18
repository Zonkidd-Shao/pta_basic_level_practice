/*
题目：1102 教超冠军卷

解题思路：
给定 N 个商品的信息（编号、单价、销售量），需要找出两个冠军：
1. 销量冠军：销售量最大的商品
2. 销售额冠军：单价×销售量最大的商品
遍历一次即可同时找出两项冠军。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
)

// paper 表示一个商品的信息
type paper struct {
	id    string // 商品编号
	price int    // 单价
	cnt   int    // 销售量
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var n int
	fmt.Fscan(in, &n)

	// 读取所有商品信息
	papers := make([]paper, n)
	for i := 0; i < n; i++ {
		fmt.Fscan(in, &papers[i].id, &papers[i].price, &papers[i].cnt)
	}

	// 遍历找出销量冠军和销售额冠军
	salesChamp := papers[0]
	revChamp := papers[0]
	for _, p := range papers[1:] {
		// 比较销售量
		if p.cnt > salesChamp.cnt {
			salesChamp = p
		}
		// 比较销售额（单价×销售量）
		if p.price*p.cnt > revChamp.price*revChamp.cnt {
			revChamp = p
		}
	}

	// 输出结果
	fmt.Fprintf(out, "%s %d\n", salesChamp.id, salesChamp.cnt)
	fmt.Fprintf(out, "%s %d\n", revChamp.id, revChamp.price*revChamp.cnt)
}