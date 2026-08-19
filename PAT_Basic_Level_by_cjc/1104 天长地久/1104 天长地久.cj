// 题目编号：1104  天长地久
// 解题思路：
//   "天长地久"数指满足以下条件的正整数 A：
//     1. A 的位数 = K
//     2. A 的各位数字之和 = m
//     3. A+1 的各位数字之和 = n
//     4. gcd(m, n) 是一个大于 2 的素数
//   由于加 1 会产生进位，当 A 末尾有连续 t 个 9 时，digitSum(A+1) = digitSum(A) - 9*t + 1
//   即 n = m - 9*t + 1，其中 t 是末尾连续 9 的个数。
//   枚举 t（末尾 9 的个数），DFS 搜索 A 的前缀部分，验证条件后按 n 和 A 排序输出。

import std.env.*
import std.convert.*
import std.math.*

// 用于存储结果对 (n, A)
class Result {
    var n: Int64
    var a: Int64

    init(n: Int64, a: Int64) {
        this.n = n
        this.a = a
    }
}

// 计算 x 的各位数字之和
func digitSum(x: Int64): Int64 {
    var s: Int64 = 0
    var t = x
    while (t > 0) {
        s += t % 10               // 取最低位数字累加
        t /= 10
    }
    return s
}

// 求最大公约数（辗转相除法）
func gcd(a: Int64, b: Int64): Int64 {
    var x = a
    var y = b
    while (y > 0) {
        let t = x % y
        x = y
        y = t
    }
    return x
}

// 判断 x 是否为素数
func isPrime(x: Int64): Bool {
    if (x <= 1) { return false }
    if (x <= 3) { return true }
    if (x % 2 == 0) { return false }
    var i: Int64 = 3
    let limit = Int64(sqrt(Float64(x))) + 1
    while (i <= limit) {
        if (x % i == 0) { return false }
        i += 2
    }
    return true
}

// 计算 10^t
func pow10(t: Int64): Int64 {
    var result: Int64 = 1
    for (_ in 0..t) {
        result *= 10
    }
    return result
}

// 全局变量：DFS 过程中存放前缀的各位数字，以及搜索结果列表
var gDigits: Array<Int64> = []
var gResults = ArrayList<Int64>()

// DFS 搜索所有满足各位数字之和等于 remaining 的前缀
// pos: 当前正在确定第几位
// remaining: 剩余需要分配的数字和
// prefixLen: 前缀的总位数
// t: 末尾连续 9 的个数
func dfs(pos: Int64, remaining: Int64, prefixLen: Int64, t: Int64) {
    if (pos == prefixLen) {
        if (remaining == 0) {
            // 已构建完前缀，末尾拼接 t 个 9 形成完整的 A
            var a: Int64 = 0
            for (i in 0..prefixLen) {
                a = a * 10 + gDigits[i]
            }
            a = a * pow10(t) + (pow10(t) - 1)   // 拼接 t 个 9
            gResults.add(a)
        }
        return
    }
    var start: Int64 = if (pos == 0) { 1 } else { 0 }   // 首位不能为 0
    var end: Int64 = if (pos == prefixLen - 1) { 8 } else { 9 }  // 前缀的最后一位不能是 9（否则会进位）
    for (d in start..end + 1) {
        if (d <= remaining) {
            gDigits[pos] = d
            dfs(pos + 1, remaining - d, prefixLen, t)
        }
    }
}

main() {
    let caseN = Int64.parse(getStdIn().readln().getOrThrow())  // 测试用例数

    for (caseIdx in 1..caseN + 1) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let K = Int64.parse(parts[0])   // A 的位数
        let m = Int64.parse(parts[1])   // A 的各位数字之和

        println("Case ${caseIdx}")

        var allResults = ArrayList<Result>()

        // 枚举末尾连续 9 的个数 t（1 到 K-1）
        for (t in 1..K) {
            // n = digitSum(A+1) = m - 9*t + 1
            let n = m - 9 * t + 1
            if (n <= 0) { continue }

            let g = gcd(m, n)
            // gcd(m, n) 必须大于 2 且是素数
            if (g <= 2 || !isPrime(g)) { continue }

            let prefixLen = K - t       // 前缀部分的位数
            if (prefixLen <= 0) { continue }

            let prefixSum = m - 9 * t   // 前缀部分的各位数字之和
            if (prefixSum < 0) { continue }

            // 首位不能为 0，如果前缀只有 1 位且 prefixSum 为 0 则不可能
            if (prefixLen == 1 && prefixSum == 0) { continue }

            // prefixSum 不能超出前缀长度的最大数字和
            if (prefixSum > 9 * prefixLen) { continue }

            // DFS 生成所有合法前缀
            gDigits = Array<Int64>(prefixLen, item: 0)
            gResults = ArrayList<Int64>()
            dfs(0, prefixSum, prefixLen, t)

            // 验证每个候选 A 是否满足所有条件
            for (a in gResults) {
                if (digitSum(a) != m) { continue }
                let actualN = digitSum(a + 1)
                let g2 = gcd(m, actualN)
                if (g2 <= 2 || !isPrime(g2)) { continue }
                allResults.add(Result(actualN, a))
            }
        }

        if (allResults.size == 0) {
            println("No Solution")
        } else {
            // 按 n 升序排列，n 相同时按 A 升序排列
            allResults.sort(func(a: Result, b: Result): Int64 {
                if (a.n != b.n) {
                    return a.n - b.n
                }
                return a.a - b.a
            })
            for (r in allResults) {
                println("${r.n} ${r.a}")
            }
        }
    }
}

