/*
 * 题目：1075 链表元素分类
 * 解题思路：
 * 将链表中的结点按数据域分为三类：负数、在 [0, K] 范围内、大于 K，
 * 并依次连接成新链表。先根据地址构建结点映射表，然后从给定头结点
 * 开始遍历链表，将结点按数据分类后重新拼接输出，保证相对顺序不变。
 */
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

// node 表示链表中的一个结点，包含地址、数据和下一结点地址。
type node struct {
	addr int
	data int
	next int
}

// main 是程序入口函数，完成链表元素分类重排。
func main() {
	scanner := bufio.NewScanner(os.Stdin)
	scanner.Buffer(make([]byte, 1024*1024), 1024*1024)
	if !scanner.Scan() {
		return
	}
	f := strings.Fields(scanner.Text())
	head, _ := strconv.Atoi(f[0]) // 链表头结点地址
	N, _ := strconv.Atoi(f[1])    // 结点总数
	K, _ := strconv.Atoi(f[2])    // 分类阈值

	// 构建结点映射（地址 -> 结点）
	nodes := make(map[int]node)
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

	// 按链接顺序遍历链表，存入切片
	list := make([]node, 0)
	for addr := head; addr != -1; addr = nodes[addr].next {
		n, ok := nodes[addr]
		if !ok {
			break
		}
		list = append(list, n)
	}

	// 负数和零在中间，大于 K 的排最后
	neg, mid, big := make([]node, 0), make([]node, 0), make([]node, 0)
	for _, n := range list {
		if n.data < 0 {
			neg = append(neg, n) // 负数
		} else if n.data <= K {
			mid = append(mid, n) // [0, K]
		} else {
			big = append(big, n) // 大于 K
		}
	}

	// 依次拼接三类结点
	ordered := append(append(neg, mid...), big...)
	// 输出重排后的链表，每个结点的 next 指向下一个结点的地址
	for i := 0; i < len(ordered); i++ {
		nx := -1
		if i+1 < len(ordered) {
			nx = ordered[i+1].addr
		}
		fmt.Printf("%05d %d %05d\n", ordered[i].addr, ordered[i].data, nx)
	}
}