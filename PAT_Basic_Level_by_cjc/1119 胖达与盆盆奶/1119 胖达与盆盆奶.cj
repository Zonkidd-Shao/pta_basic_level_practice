// 1119 胖达与盆盆奶
// 解题思路：使用双向扫描的贪心算法。两次遍历保证每只熊猫得到的奶量同时满足左右两边
// 的比较约束（更重的熊猫奶更多，等重的奶量相等），每只熊猫最少200ml，相邻差至少100ml。

import std.env.*
import std.convert.*

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 胖达数量
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")

    var weights = Array<Int64>(n, repeat: 0)  // 每只胖达的体重
    for (i in 0..n) {
        weights[i] = Int64.parse(parts[Int64(i)])
    }

    var milk = Array<Int64>(n, repeat: 200)  // 每只胖达的初始奶量（最少200ml）

    // 从左到右扫描：保证每只胖达比左边更重的胖达奶量多100ml
    for (i in 1..n) {
        if (weights[i] > weights[i - 1]) {
            milk[i] = milk[i - 1] + 100
        } else if (weights[i] == weights[i - 1]) {
            milk[i] = milk[i - 1]  // 等重则奶量相同
        }
    }

    // 从右到左扫描：保证每只胖达比右边更重的胖达奶量多100ml
    var i: Int64 = n - 2
    while (i >= 0) {
        if (weights[i] > weights[i + 1]) {
            // 如果当前奶量不满足右边约束，则增加
            if (milk[i] < milk[i + 1] + 100) {
                milk[i] = milk[i + 1] + 100
            }
        } else if (weights[i] == weights[i + 1]) {
            // 等重时取较大值以保证两边约束一致
            if (milk[i] < milk[i + 1]) {
                milk[i] = milk[i + 1]
            }
        }
        i--
    }

    // 计算总奶量
    var total: Int64 = 0
    for (v in milk) {
        total += v
    }
    println(total)
}

