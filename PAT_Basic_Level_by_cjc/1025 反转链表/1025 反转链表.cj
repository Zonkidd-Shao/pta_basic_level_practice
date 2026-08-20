// PAT Basic Level 1025 反转链表
// 解题思路：给定一个链表和每 K 个一组反转的要求，先按地址顺序将链表节点读入数组，
// 然后每 K 个节点为一组进行反转，最后更新每个节点的 next 指针并输出。
import std.env.*
import std.convert.*
import std.collection.*

// 链表节点：包含地址、数据和下一节点地址
class Node {
    var addr: String    // 节点地址（5 位字符串）
    var data: Int64     // 节点数据
    var next: String    // 下一节点地址

    init(addr: String, data: Int64, next: String) {
        this.addr = addr
        this.data = data
        this.next = next
    }
}

main(): Int64 {
    // 读入头节点地址、节点总数 N 和每段反转长度 K
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let headAddr = parts[0]
    let N = Int64.parse(parts[1])
    let K = Int64.parse(parts[2])

    // 用数组存储所有节点，地址为 5 位数，最大 100000
    var nodes = Array<Node>(100000, repeat: Node("", 0, ""))

    // 读取所有节点信息，按地址存入数组
    for (_ in 0..N) {
        let nodeLine = getStdIn().readln().getOrThrow()
        let nodeParts = nodeLine.split(" ")
        let addr = nodeParts[0]
        let data = Int64.parse(nodeParts[1])
        let next = nodeParts[2]
        nodes[Int64.parse(addr)] = Node(addr, data, next)
    }

    // 从 headAddr 开始按链接顺序将所有节点加入列表
    var list = ArrayList<Node>()
    var curAddr = headAddr
    while (curAddr != "-1") {
        let idx = Int64.parse(curAddr)
        list.add(nodes[idx])
        curAddr = nodes[idx].next
    }

    // 每 K 个节点为一组进行反转
    let total = list.size
    var i: Int64 = 0
    while (i + K <= total) {
        // 对当前组内的 K 个节点进行首尾交换（反转）
        var j: Int64 = 0
        while (j < K / 2) {
            let tmp = list[i + j]
            list[i + j] = list[i + K - 1 - j]
            list[i + K - 1 - j] = tmp
            j++
        }
        i += K  // 跳到下一组
    }

    // 输出结果：每个节点的地址、数据和下一节点的地址
    for (idx in 0..total) {
        if (idx == total - 1) {
            // 最后一个节点的 next 为 -1
            println("${list[idx].addr} ${list[idx].data} -1")
        } else {
            // 普通节点的 next 指向列表中的下一个节点地址
            println("${list[idx].addr} ${list[idx].data} ${list[idx+1].addr}")
        }
    }
    return 0
}

