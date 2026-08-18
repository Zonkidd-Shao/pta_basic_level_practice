// 1117 数字之王
// 解题思路：对[N1, N2]区间内的每个数反复执行变换（各位数字的立方相乘，再求各位和），
// 直到所有数都变成一位数，统计每个一位数出现的次数，输出出现最多的数字。

import std.env.*
import std.convert.*

// 一次变换操作：将数字n的每一位取立方后相乘，再对乘积的各位求和
func transform(n: Int64): Int64 {
    if (n == 0) {
        return 0
    }
    let s = n.toString()
    var product: Int64 = 1
    // 每位数字的立方相乘
    for (i in 0..s.size) {
        let d = Int64.parse(s[i].toString())
        product *= d * d * d
    }
    // 对乘积的各位数字求和
    let ps = product.toString()
    var sum: Int64 = 0
    for (i in 0..ps.size) {
        sum += Int64.parse(ps[i].toString())
    }
    return sum
}

// 反复变换直到结果变为一位数
func reduceToDigit(n: Int64): Int64 {
    var cur = n
    while (cur >= 10) {
        cur = transform(cur)
    }
    return cur
}

main() {
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let N1 = Int64.parse(parts[0])  // 区间起点
    let N2 = Int64.parse(parts[1])  // 区间终点

    var counts = Array<Int64>(10, item: 0)  // 统计每个一位数字(0-9)的出现次数

    // 对区间内的每个数进行规约，统计结果
    for (n in N1..(N2 + 1)) {
        let d = reduceToDigit(n)
        counts[d]++
    }

    // 找出出现次数的最大值
    var maxCount: Int64 = 0
    for (i in 0..10) {
        if (counts[i] > maxCount) {
            maxCount = counts[i]
        }
    }

    // 输出最大出现次数
    println(maxCount)
    // 输出所有出现次数等于最大值的数字（递增序）
    var first = true
    for (i in 0..10) {
        if (counts[i] == maxCount) {
            if (!first) {
                print(" ")
            }
            print(i)
            first = false
        }
    }
    println()
}

