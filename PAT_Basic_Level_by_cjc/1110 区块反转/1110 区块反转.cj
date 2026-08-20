// 题目编号：1110  区块反转
// 解题思路：
//   给定一个单链表和一个正整数 K，将链表按每 K 个节点分为一块，
//   然后反转块的顺序（块内节点顺序不变），重新输出链表。
//   使用 HashMap 按地址存储节点，遍历得到原始顺序后分块、反转块顺序，再输出。

import std.env.*
import std.convert.*
import std.collection.*

// 链表节点类
class Node {
    var addr: Int64   // 当前节点地址
    var data: Int64   // 节点数据
    var next: Int64   // 下一个节点地址

    init(addr: Int64, data: Int64, next: Int64) {
        this.addr = addr
        this.data = data
        this.next = next
    }
}

// 格式化地址为 5 位（不足前面补 0），-1 直接返回 "-1"
func formatAddr(addr: Int64): String {
    if (addr == -1) {
        return "-1"
    }
    var s = addr.toString()
    while (s.size < 5) {
        s = "0" + s
    }
    return s
}

main() {
    // 读取链表头地址、节点总数和块大小 K
    let first = getStdIn().readln().getOrThrow().split(" ")
    let head = Int64.parse(first[0])
    let n = Int64.parse(first[1])
    let k = Int64.parse(first[2])

    // 将所有节点存入 HashMap，以地址为键
    let nodeMap = HashMap<Int64, Node>()
    for (_ in 0..n) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let addr = Int64.parse(parts[0])
        let data = Int64.parse(parts[1])
        let next = Int64.parse(parts[2])
        nodeMap[addr] = Node(addr, data, next)
    }

    // 从头节点开始遍历，按原始顺序收集节点地址
    var order = ArrayList<Int64>()
    var cur = head
    while (cur != -1) {
        let node = nodeMap.get(cur)
        if (node.isNone()) { break }
        order.add(cur)
        cur = node.getOrThrow().next
    }

    let total = order.size
    // 将链表按每 K 个节点分为一块
    var blocks = ArrayList<ArrayList<Int64>>()
    var i: Int64 = 0
    while (i < total) {
        var block = ArrayList<Int64>()
        var j: Int64 = 0
        while (j < k && i < total) {
            block.add(order[i])
            i++
            j++
        }
        blocks.add(block)              // 将当前块加入块列表
    }

    // 反转块顺序（块内节点顺序不变）
    var result = ArrayList<Int64>()
    var bi: Int64 = blocks.size - 1
    while (bi >= 0) {
        let block = blocks[bi]
        for (addr in block) {
            result.add(addr)
        }
        bi--
    }

    // 按格式输出反转后的链表
    for (idx in 0..result.size) {
        let addr = result[idx]
        let node = nodeMap.get(addr).getOrThrow()
        let nextAddr = if (idx < result.size - 1) { result[idx + 1] } else { -1 }
        println("${formatAddr(addr)} ${node.data} ${formatAddr(nextAddr)}")
    }
}

