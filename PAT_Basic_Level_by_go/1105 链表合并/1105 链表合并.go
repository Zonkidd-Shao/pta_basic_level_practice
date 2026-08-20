/*
题目：1105 链表合并

解题思路：
给定两个单链表（每个节点包含地址、数据、下一节点地址），
将较短的链表反转后，按每隔两个长链表节点插入一个短链表节点的
方式合并。具体做法：先用 map 存储所有节点，根据头节点地址
依次构建两个有序链表（切片），确定长短链表后反转短链表，
再按 2 长 + 1 短的规律交错合并，最后格式化输出。
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

// buildList 根据头节点地址从 map 中依次取出节点，构建有序链表切片
func buildList(head int, nodes map[int]node) []node {
	var list []node
	cur := head
	seen := make(map[int]bool) // 防止循环链表
	for cur != -1 && !seen[cur] {
		seen[cur] = true
		n := nodes[cur]
		list = append(list, n)
		cur = n.next
	}
	return list
}

// reverse 反转链表切片
func reverse(l []node) []node {
	r := make([]node, len(l))
	for i, n := range l {
		r[len(l)-1-i] = n
	}
	return r
}

func main() {
	// 初始化标准输入输出
	in := bufio.NewReader(os.Stdin)
	out := bufio.NewWriter(os.Stdout)
	defer out.Flush()

	var h1Text, h2Text string
	var n int
	fmt.Fscan(in, &h1Text, &h2Text, &n)
	h1, _ := strconv.Atoi(h1Text)
	h2, _ := strconv.Atoi(h2Text)

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

	// 构建两个链表
	l1 := buildList(h1, nodes)
	l2 := buildList(h2, nodes)

	// 确定长链表和短链表，并将短链表反转
	long, short := l1, l2
	if len(l2) > len(l1) {
		long, short = l2, l1
	}
	short = reverse(short)

	// 依次取两个长链表节点，再取一个逆序后的短链表节点。
	var res []node
	i, j := 0, 0
	for i < len(long) {
		res = append(res, long[i])
		if i%2 == 1 && j < len(short) {
			res = append(res, short[j])
			j++
		}
		i++
	}

	// 输出合并后的链表，每个节点的 next 指向结果中下一个节点的地址
	for idx, nd := range res {
		nxt := -1
		if idx+1 < len(res) {
			nxt = res[idx+1].addr
		}
		fmt.Fprintf(out, "%05d %d %s\n", nd.addr, nd.data, formatAddr(nxt))
	}
}

// formatAddr 格式化地址输出，-1 直接输出，否则补零到 5 位
func formatAddr(a int) string {
	if a == -1 {
		return "-1"
	}
	return fmt.Sprintf("%05d", a)
}
