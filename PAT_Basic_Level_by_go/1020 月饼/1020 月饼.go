// 题目：1020 月饼
// 实现原理：有 N 种月饼，每种有库存量和总售价，市场需求量为 D 万吨。
// 按单价（总售价/库存量）从高到低排序，优先售卖单价高的月饼，使总收益最大。
// 贪心策略：每次取单价最高的月饼，若库存量满足需求则全部卖出，否则卖出部分。

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

// moon 结构体表示一种月饼的库存、总售价和单价
type moon struct {
	stock, price, density float64
}

// main 是程序入口函数，读取月饼信息和市场需求量，计算最大收益。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	N, _ := strconv.Atoi(f[0])
	D, _ := strconv.ParseFloat(f[1], 64)
	scanner.Scan()
	stocks := strings.Fields(scanner.Text())
	scanner.Scan()
	prices := strings.Fields(scanner.Text())
	moons := make([]moon, N)
	// 初始化每种月饼的库存量、总售价和单价
	for i := 0; i < N; i++ {
		s, _ := strconv.ParseFloat(stocks[i], 64)
		p, _ := strconv.ParseFloat(prices[i], 64)
		moons[i] = moon{stock: s, price: p, density: p / s}
	}
	// 按单价降序排序
	sort.Slice(moons, func(i, j int) bool { return moons[i].density > moons[j].density })
	revenue := 0.0
	// 贪心售卖：从单价最高的开始
	for i := 0; i < N && D > 0; i++ {
		if moons[i].stock <= D {
			// 库存量不足，全部卖出
			revenue += moons[i].price
			D -= moons[i].stock
		} else {
			// 只需卖出部分，按单价计算收益
			revenue += moons[i].density * D
			D = 0
		}
	}
	fmt.Printf("%.2f\n", revenue)
}