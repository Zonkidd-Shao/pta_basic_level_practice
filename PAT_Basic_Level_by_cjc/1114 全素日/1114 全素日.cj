// 1114 全素日
// 解题思路：给定一个yyyymmdd格式的日期，从完整日期开始依次去掉首位，
// 判断每个子串对应的数字是否为素数。若所有子串均为素数，则该日为"全素日"。

import std.env.*
import std.convert.*

// 判断一个整数是否为素数
func isPrime(n: Int64): Bool {
    if (n < 2) {
        return false
    }
    if (n == 2) {
        return true
    }
    if (n % 2 == 0) {  // 排除偶数
        return false
    }
    // 从3开始只检查奇数因子，到sqrt(n)为止
    var i: Int64 = 3
    while (i * i <= n) {
        if (n % i == 0) {
            return false
        }
        i += 2
    }
    return true
}

main() {
    let dateStr = getStdIn().readln().getOrThrow()  // 读取日期字符串
    let len = dateStr.size

    var allPrime = true  // 标记是否所有子串都是素数
    // 从完整日期开始，依次去掉最左边一位，生成所有以末位结尾的子串
    for (start in 0..len) {
        let sub = dateStr[start..]       // 从start到末尾的子串
        let num = Int64.parse(sub)       // 转为整数
        let ok = isPrime(num)            // 判断是否为素数
        let status = if (ok) { "Yes" } else { "No" }
        println("${sub} ${status}")
        if (!ok) {
            allPrime = false
        }
    }

    // 所有子串都是素数，输出"All Prime!"
    if (allPrime) {
        println("All Prime!")
    }
}

