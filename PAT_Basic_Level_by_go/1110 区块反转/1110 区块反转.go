/*
题目：1110 区块反转

解题思路：
给定一个单链表和一个正整数 K，将链表按每 K 个节点划分为区块，
然后反转所有区块之间的链接，区块内部的节点顺序保持不变。
实现上先构建有序链表切片，再按 K 分组并以相反顺序拼接。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

// node 表示链表中的一个节点
type node struct {
	addr int // 当前节点地址
	data int // 节点数据
	next int // 下一节点地址
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var headText string
	var n, k int
	fmt.Fscan(in, &headText, &n, &k)
	head, _ := strconv.Atoi(headText)

	// 读取所有节点存入 map，以地址为键
	nodes := make(map[int]node, n)
	for i := 0; i < n; i++ {
		var aText, nextText string
		var d int
		fmt.Fscan(in, &aText, &d, &nextText)
		a, _ := strconv.Atoi(aText)
		nx, _ := strconv.Atoi(nextText)
		nodes[a] = node{a, d, nx}
	}

	// 根据头节点地址构建有序链表切片
	var list []node
	cur := head
	seen := make(map[int]bool) // 防止循环链表
	for cur != -1 && !seen[cur] {
		seen[cur] = true
		nd := nodes[cur]
		list = append(list, nd)
		cur = nd.next
	}

	// 按 K 个节点划分区块，再将区块整体逆序；区块内部顺序不变。
	blocks := make([][]node, 0, (len(list)+k-1)/k)
	for i := 0; i < len(list); i += k {
		end := i + k
		if end > len(list) {
			end = len(list)
		}
		blocks = append(blocks, list[i:end])
	}
	var result []node
	for i := len(blocks) - 1; i >= 0; i-- {
		result = append(result, blocks[i]...)
	}

	// 输出结果，每个节点的 next 指向结果中下一个节点的地址
	for idx, nd := range result {
		nxt := -1
		if idx+1 < len(result) {
			nxt = result[idx+1].addr
		}
		if nxt == -1 {
			fmt.Fprintf(out, "%05d %d -1\n", nd.addr, nd.data)
		} else {
			fmt.Fprintf(out, "%05d %d %05d\n", nd.addr, nd.data, nxt)
		}
	}
}
