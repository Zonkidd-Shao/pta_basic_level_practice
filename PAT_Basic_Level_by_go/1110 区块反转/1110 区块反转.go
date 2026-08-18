/*
题目：1110 区块反转

解题思路：
给定一个单链表和一个正整数 K，将链表按每 K 个节点一组进行反转。
即从链表头部开始，每 K 个节点构成一个区块，将每个区块内的节点
顺序反转，最后区块顺序不变。如果最后一组不足 K 个节点则不反转。
实现上先构建有序链表切片，然后按 K 分组反转后再拼接。
*/

package main

import (
	"bufio"
	"fmt"
	"os"
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

	var head, n, k int
	fmt.Fscan(in, &head, &n, &k)

	// 读取所有节点存入 map，以地址为键
	nodes := make(map[int]node, n)
	for i := 0; i < n; i++ {
		var a, d, nx int
		fmt.Fscan(in, &a, &d, &nx)
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

	// 按 K 个一组反转区块
	var result []node
	for i := 0; i < len(list); i += k {
		end := i + k
		if end > len(list) {
			end = len(list) // 最后一组不足 K 个时不反转
		}
		block := list[i:end]
		// 反转该区块内的节点顺序
		for j := len(block) - 1; j >= 0; j-- {
			result = append(result, block[j])
		}
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