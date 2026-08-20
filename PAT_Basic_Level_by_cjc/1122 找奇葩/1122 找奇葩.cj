// 1122 找奇葩
// 解题思路：在正整数序列中，所有奇数都出现偶数次，只有一个奇数出现奇数次。
// 使用计数数组统计每个奇数的出现次数，找到出现次数为奇数的那个数即可。

import std.env.*
import std.convert.*

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 序列长度
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")

    var counts = Array<Int64>(100001, repeat: 0)  // 计数数组，下标为数值

    // 统计每个奇数的出现次数（偶数不参与统计）
    for (i in 0..n) {
        let val = Int64.parse(parts[Int64(i)])
        if (val % 2 == 1) {  // 只统计奇数
            counts[val]++
        }
    }

    // 找到出现次数为奇数的数（即奇葩数）
    for (i in 0..100001) {
        if (counts[i] % 2 == 1) {
            println(i)
            break
        }
    }
}

