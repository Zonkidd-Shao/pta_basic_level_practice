import std.env.*
import std.convert.*

// 1007 素数对猜想
// 解题思路：使用埃拉托斯特尼筛法（Sieve of Eratosthenes）
// 找出不超过 n 的所有素数，然后统计相邻且差为 2 的素数对的个数。
main(): Int64 {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 读取正整数 n
    if (n < 5) {           // 最小的素数对 (3,5) 需要 n >= 5
        println(0)
        return 0
    }
    let isPrime = Array<Bool>(n + 1, repeat: true)  // 布尔数组标记是否为素数
    isPrime[0] = false
    isPrime[1] = false
    var i: Int64 = 2
    while (i * i <= n) {          // 埃拉托斯特尼筛法：从 2 开始筛
        if (isPrime[i]) {
            var j: Int64 = i * i
            while (j <= n) {
                isPrime[j] = false  // 标记 i 的倍数为非素数
                j = j + i
            }
        }
        i = i + 1
    }
    var count: Int64 = 0        // 统计素数对个数
    i = 3
    while (i <= n - 2) {         // 遍历所有奇数，检查相邻素数差是否为 2
        if (isPrime[i] && isPrime[i + 2]) {
            count = count + 1   // 找到一对差为 2 的素数对
        }
        i = i + 2               // 只检查奇数（大于 2 的素数都是奇数）
    }
    println(count)              // 输出素数对的个数
    return 0
}

