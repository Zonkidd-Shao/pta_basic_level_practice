import std.env.*
import std.convert.*

// 1075 链表元素分类
// 思路：读取链表节点存入哈希表，按链表顺序将节点收集到列表中，
// 然后将节点分为三类：负数、[0,K]区间内、大于K，
// 最后按顺序输出分类后的链表，并格式化5位地址。

// 链表节点结构体
class Node {
    var addr: Int64  // 节点地址
    var data: Int64  // 节点数据
    var next: Int64  // 下一节点地址

    init(addr: Int64, data: Int64, next: Int64) {
        this.addr = addr
        this.data = data
        this.next = next
    }
}

main(): Int64 {
    // 读取首行：头节点地址、节点总数N、分类阈值K
    let first = getStdIn().readln().getOrThrow().split(" ")
    let head = Int64.parse(first[0])
    let n = Int64.parse(first[1])
    let k = Int64.parse(first[2])

    // 用哈希表存储所有节点，地址作为键
    let nodeMap = HashMap<Int64, Node>()
    for (_ in 1..=n) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let addr = Int64.parse(parts[0])
        let data = Int64.parse(parts[1])
        let next = Int64.parse(parts[2])
        nodeMap.put(addr, Node(addr, data, next))
    }

    // 从链表头开始，按原始顺序收集所有节点
    var nodes = ArrayList<Node>()
    var cur = head
    while (cur != -1) {
        let node = nodeMap.get(cur)
        if (node != nil) {
            nodes.add(node.getOrThrow())
            cur = node.getOrThrow().next
        } else {
            break
        }
    }

    // 将节点分为三类：负数、[0,K]区间内、大于K
    var negList = ArrayList<Node>()
    var midList = ArrayList<Node>()
    var highList = ArrayList<Node>()

    for (node in nodes) {
        if (node.data < 0) {
            negList.add(node)           // 负值元素
        } else if (node.data <= k) {
            midList.add(node)           // [0, K]区间内的元素
        } else {
            highList.add(node)          // 大于K的元素
        }
    }

    // 按顺序合并三类列表：负数 -> [0,K] -> 大于K
    var result = ArrayList<Node>()
    for (node in negList) { result.add(node) }
    for (node in midList) { result.add(node) }
    for (node in highList) { result.add(node) }

    // 输出重排后的链表，地址格式化为5位数字
    for (i in 0..result.size) {
        let curNode = result[i]
        let nextAddr = if (i + 1 < result.size) { result[i + 1].addr } else { -1 }
        let nextStr = if (nextAddr == -1) { "-1" } else { format5(nextAddr) }
        println("${format5(curNode.addr)} ${curNode.data} ${nextStr}")
    }
    return 0
}

// 将地址格式化为5位数字，不足5位前面补0
func format5(addr: Int64): String {
    var s = addr.toString()
    while (s.size < 5) {
        s = "0" + s
    }
    return s
}