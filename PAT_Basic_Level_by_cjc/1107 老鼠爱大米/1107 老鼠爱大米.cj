// 题目编号：1107  老鼠爱大米
// 解题思路：
//   有 n 组老鼠，每组 m 只，每只有体重。
//   先找出每组中最重的老鼠体重（组冠军），再找出所有组冠军中的最重值（总冠军）。
//   输出每组的冠军体重，再输出总冠军体重。

import std.env.*
import std.convert.*

main() {
    // 读取组数 n 和每组老鼠数 m
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let n = Int64.parse(parts[0])
    let m = Int64.parse(parts[1])

    var champions = Array<Int64>(n, repeat: 0)  // 存储每组的最大体重
    var overallMax: Int64 = -1               // 总冠军体重

    for (i in 0..n) {
        let groupLine = getStdIn().readln().getOrThrow()
        let weights = groupLine.split(" ")
        var groupMax: Int64 = -1
        // 找出当前组的最大体重
        for (j in 0..m) {
            let w = Int64.parse(weights[j])
            if (w > groupMax) {
                groupMax = w
            }
        }
        champions[i] = groupMax             // 记录组冠军
        if (groupMax > overallMax) {
            overallMax = groupMax           // 更新总冠军
        }
    }

    // 输出所有组冠军（空格分隔）
    var output = ""
    for (i in 0..n) {
        if (i > 0) {
            output += " "
        }
        output += champions[i].toString()
    }
    println(output)
    // 输出总冠军体重
    println(overallMax)
}

