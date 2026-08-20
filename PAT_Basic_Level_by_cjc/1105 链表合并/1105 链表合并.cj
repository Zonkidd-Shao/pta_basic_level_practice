// 题目编号：1105  链表合并
// 解题思路：
//   给定两个单链表 L1 和 L2，将较短的链表反转后，按每取 2 个长链表节点、
//   取 1 个短链表（已反转）节点的规则交替合并。
//   使用 HashMap 按地址存储所有节点，通过地址遍历链表构建顺序列表，
//   然后按规则合并输出。

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
    // 读取两个链表的头节点地址和总节点数
    let first = getStdIn().readln().getOrThrow().split(" ")
    let head1 = Int64.parse(first[0])   // 第一个链表头地址
    let head2 = Int64.parse(first[1])   // 第二个链表头地址
    let n = Int64.parse(first[2])       // 节点总数

    // 将所有节点存入 HashMap，以地址为键
    let nodeMap = HashMap<Int64, Node>()
    for (_ in 0..n) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let addr = Int64.parse(parts[0])
        let data = Int64.parse(parts[1])
        let next = Int64.parse(parts[2])
        nodeMap[addr] = Node(addr, data, next)
    }

    // 从 head1 开始遍历，构建链表 L1 的地址顺序列表
    var list1 = ArrayList<Int64>()
    var cur = head1
    while (cur != -1) {
        let node = nodeMap.get(cur)
        if (node.isNone()) { break }
        list1.add(cur)
        cur = node.getOrThrow().next
    }

    // 从 head2 开始遍历，构建链表 L2 的地址顺序列表
    var list2 = ArrayList<Int64>()
    cur = head2
    while (cur != -1) {
        let node = nodeMap.get(cur)
        if (node.isNone()) { break }
        list2.add(cur)
        cur = node.getOrThrow().next
    }

    // 确定长链表和短链表（长链表先取）
    var longer = list1
    var shorter = list2
    if (list1.size < list2.size) {
        longer = list2
        shorter = list1
    }

    // 反转短链表
    var shortRev = ArrayList<Int64>()
    var si: Int64 = shorter.size - 1
    while (si >= 0) {
        shortRev.add(shorter[si])
        si--
    }

    // 按规则合并：从长链表取 2 个节点，再从反转后的短链表取 1 个节点
    var result = ArrayList<Int64>()
    var li: Int64 = 0     // 长链表索引
    var rsi: Int64 = 0    // 反转短链表索引
    while (rsi < shortRev.size) {
        result.add(longer[li]); li++
        result.add(longer[li]); li++
        result.add(shortRev[rsi]); rsi++
    }
    // 将长链表剩余节点全部加入结果
    while (li < longer.size) {
        result.add(longer[li]); li++
    }

    // 按格式输出合并后的链表
    for (idx in 0..result.size) {
        let addr = result[idx]
        let node = nodeMap.get(addr).getOrThrow()
        let nextAddr = if (idx < result.size - 1) { result[idx + 1] } else { -1 }
        println("${formatAddr(addr)} ${node.data} ${formatAddr(nextAddr)}")
    }
}

