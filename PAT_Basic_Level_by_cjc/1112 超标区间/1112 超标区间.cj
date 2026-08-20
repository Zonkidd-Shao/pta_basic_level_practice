// 题目编号：1112  超标区间
// 解题思路：
//   给定 N 个正整数和一个阈值 T，找出数组中所有连续大于 T 的子区间。
//   遍历数组，当遇到大于 T 的元素时记录起始位置，连续向右扩展直到遇到不大于 T 的元素，
//   输出该区间 [start, end]。如果没有找到任何超标区间，则输出数组中的最大值。

import std.env.*
import std.convert.*

main() {
    // 读取 N（数组长度）和 T（阈值）
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let N = Int64.parse(parts[0])
    let T = Int64.parse(parts[1])

    // 读取数组数据
    let dataLine = getStdIn().readln().getOrThrow()
    let data = dataLine.split(" ")
    var vals = Array<Int64>(N, repeat: 0)
    var maxVal: Int64 = 0
    for (i in 0..N) {
        vals[i] = Int64.parse(data[Int64(i)])
        if (vals[i] > maxVal) {
            maxVal = vals[i]             // 记录数组中的最大值
        }
    }

    var hasOver = false                   // 是否找到超标区间
    var i: Int64 = 0
    while (i < N) {
        if (vals[i] > T) {
            let start = i                // 记录超标区间的起始位置
            while (i < N && vals[i] > T) {
                i++                      // 连续向右扩展
            }
            let end = i - 1              // 超标区间的结束位置
            println("[${start}, ${end}]")
            hasOver = true
        } else {
            i++
        }
    }

    // 如果没有超标区间，输出数组中的最大值
    if (!hasOver) {
        println(maxVal)
    }
}

