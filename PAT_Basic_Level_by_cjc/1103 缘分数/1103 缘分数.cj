// 题目编号：1103  缘分数
// 解题思路：
//   给定正整数范围 [m, n]，寻找满足以下条件的正整数对 (a, b)：
//     a^3 - (a-1)^3  =  c  （c 为完全平方数）
//     且 c = b^2 + (b-1)^2
//   即 a^3 - (a-1)^3 的值既是一个完全平方数，又能表示为两个连续平方数之和。
//   通过解二次方程求 b，验证条件后输出。

import std.env.*
import std.convert.*
import std.math.*

// 判断 x 是否为完全平方数
func isPerfectSquare(x: Int64): Bool {
    let r = Int64(sqrt(Float64(x)))     // 取平方根后取整
    return r * r == x                   // 验证平方根的平方是否等于原数
}

main() {
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let m = Int64.parse(parts[0])       // 范围起始
    let n = Int64.parse(parts[1])       // 范围结束

    var found = false
    for (a in m..=n) {
        // 计算 a^3 - (a-1)^3，即连续立方数之差
        let diff = a * a * a - (a - 1) * (a - 1) * (a - 1)
        if (!isPerfectSquare(diff)) {
            continue                    // 差值不是完全平方数，跳过
        }
        let c = Int64(sqrt(Float64(diff)))  // c 为差值的平方根
        // 需要满足 c = b^2 + (b-1)^2 = 2*b^2 - 2*b + 1
        // 整理得 2*b^2 - 2*b + 1 - c = 0
        // 判别式：disc = 4 - 8*(1 - c) = 8*c - 4
        let disc = 8 * c - 4
        if (!isPerfectSquare(disc)) {
            continue                    // 判别式不是完全平方数，无整数解
        }
        let sqrtDisc = Int64(sqrt(Float64(disc)))
        if (sqrtDisc % 2 != 0) {
            continue                    // sqrtDisc 需为偶数，b 才能是整数
        }
        let b = (2 + sqrtDisc) / 4      // 求根公式计算 b
        // 验证 b 为正整数且满足等式
        if (b > 0 && b * b + (b - 1) * (b - 1) == c) {
            println("${a} ${b}")
            found = true
        }
    }

    if (!found) {
        println("No Solution")          // 未找到任何缘分数对
    }
}

