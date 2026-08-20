/*
 * 题目：1025 反转链表
 * 实现原理：用 map 存储所有节点（地址→节点），从给定首地址开始遍历链表，将节点按顺序
 * 存入切片。然后每 K 个节点为一组进行反转（原地交换），最后更新每个节点的 next 指针
 * 指向下一节点的地址并输出。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type node struct {
	addr int
	data int
	next int
}

// 反转链表：每 K 个节点为一组反转，输出新链表。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	head, _ := strconv.Atoi(f[0])
	N, _ := strconv.Atoi(f[1])
	K, _ := strconv.Atoi(f[2])
	nodes := make(map[int]node) // 用 map 以地址为键存储所有节点
	for i := 0; i < N; i++ {
		if !scanner.Scan() {
			break
		}
		p := strings.Fields(scanner.Text())
		a, _ := strconv.Atoi(p[0])
		d, _ := strconv.Atoi(p[1])
		nx, _ := strconv.Atoi(p[2])
		nodes[a] = node{addr: a, data: d, next: nx}
	}
	list := make([]node, 0)
	// 从首地址开始，按 next 指针遍历，将有效节点存入切片
	for addr := head; addr != -1; addr = nodes[addr].next {
		n, ok := nodes[addr]
		if !ok {
			break
		}
		list = append(list, n)
	}
	// 每 K 个节点为一组，原地反转
	for i := 0; i+K <= len(list); i += K {
		for l, r := i, i+K-1; l < r; l, r = l+1, r-1 {
			list[l], list[r] = list[r], list[l]
		}
	}
	// 输出结果，每个节点的 next 指向下一节点的地址
	for i := 0; i < len(list); i++ {
		nx := -1
		if i+1 < len(list) {
			nx = list[i+1].addr
		}
		fmt.Printf("%05d %d %s\n", list[i].addr, list[i].data, formatAddr(nx))
	}
}

func formatAddr(addr int) string {
	if addr == -1 {
		return "-1"
	}
	return fmt.Sprintf("%05d", addr)
}
