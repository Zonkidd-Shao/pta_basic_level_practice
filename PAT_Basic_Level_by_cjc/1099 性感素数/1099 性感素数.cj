// 题目编号：1099  性感素数
// 解题思路：
//   性感素数是指形如 (p, p+6) 的一对素数。
//   给定正整数 N，先判断 N 是否为性感素数：
//     - 若是，输出"Yes"并输出与之配对的另一个性感素数（优先输出较小的 p-6）
//     - 若否，输出"No"并输出大于 N 的最小性感素数
//   核心是素数判断函数 isPrime，以及性感素数判定 isSexyPrime

import std.env.*
import std.convert.*

// 判断 n 是否为素数
func isPrime(n: Int64): Bool {
    if (n < 2) {
        return false           // 小于2不是素数
    }
    if (n == 2) {
        return true            // 2是素数
    }
    if (n % 2 == 0) {
        return false           // 偶数（>2）不是素数
    }
    var i: Int64 = 3
    while (i * i <= n) {       // 只需检查到 sqrt(n)
        if (n % i == 0) {
            return false       // 能整除，不是素数
        }
        i += 2                 // 只检查奇数因子
    }
    return true
}

// 判断 n 是否为性感素数：n 本身是素数，且 n+6 或 n-6 也是素数
func isSexyPrime(n: Int64): Bool {
    return isPrime(n) && (isPrime(n + 6) || isPrime(n - 6))
}

// 获取与 n 配对的另一个性感素数（优先返回较小的 n-6）
func sexyPartner(n: Int64): Int64 {
    if (isPrime(n - 6)) {
        return n - 6
    }
    return n + 6
}

main() {
    // 读取输入的正整数 N
    var N = Int64.parse(getStdIn().readln().getOrThrow())
    if (isSexyPrime(N)) {
        println("Yes")
        var partner = sexyPartner(N)
        println(partner)       // 输出配对的另一个性感素数
    } else {
        println("No")
        var p = N + 1
        // 从 N+1 开始逐个查找，找到第一个性感素数
        while (!isSexyPrime(p)) {
            p++
        }
        println(p)
    }
}

