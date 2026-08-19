// 1094 谷歌的招聘
// 解题思路：在长度为 L 的数字串中，找出第一个长度为 K 的连续子串
// 使其构成的整数是素数，输出该子串；若不存在则输出 "404"。
import std.env.*
import std.convert.*

// 判断整数 n 是否为素数
func isPrime(n: Int64): Bool {
    if (n < 2) {
        return false
    }
    if (n == 2) {
        return true
    }
    if (n % 2 == 0) {
        return false
    }
    var i: Int64 = 3
    // 只需检查到 sqrt(n)，步长为2（跳过偶数）
    while (i * i <= n) {
        if (n % i == 0) {
            return false
        }
        i += 2
    }
    return true
}

main() {
    // 读取 L（数字串长度）和 K（目标素数位数）
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var L = Int64.parse(parts[0])
    var K = Int64.parse(parts[1])
    // 读取长度为 L 的数字串
    var N = getStdIn().readln().getOrThrow()
    var found = false
    // 从左到右滑动窗口，截取长度为 K 的子串
    for (i in 0..(L - K + 1)) {
        var sub = N[Int64(i)..(Int64(i) + K)]
        var num = Int64.parse(sub)
        // 检查该 K 位数是否为素数
        if (isPrime(num)) {
            println(sub)
            found = true
            break
        }
    }
    if (!found) {
        println("404")
    }
}

