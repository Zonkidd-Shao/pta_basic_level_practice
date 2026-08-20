// PAT Basic Level 1013 数素数
// 解题思路：使用埃拉托斯特尼筛法（Sieve of Eratosthenes）预先生成足够多的素数，
// 然后输出第 m 到第 n 个素数，每 10 个数换行。
import std.env.*
import std.convert.*
import std.collection.*

main(): Int64 {
    // 读入 m 和 n，表示需要输出第 m 到第 n 个素数
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let m = Int64.parse(parts[0])
    let n = Int64.parse(parts[1])
    // 筛法求素数的上限：n <= 10000，第 10000 个素数约为 104729，取 110000 确保足够
    let maxN: Int64 = 110000
    let isPrime = Array<Bool>(maxN + 1, repeat: true)
    isPrime[0] = false
    isPrime[1] = false
    var i: Int64 = 2
    // 埃拉托斯特尼筛法：从 2 开始，将每个素数的倍数标记为合数
    while (i * i <= maxN) {
        if (isPrime[i]) {
            var j: Int64 = i * i
            while (j <= maxN) {
                isPrime[j] = false
                j = j + i
            }
        }
        i = i + 1
    }
    // 将所有素数收集到列表中
    var primes = ArrayList<Int64>()
    for (i in 2..=maxN) {
        if (isPrime[i]) {
            primes.add(i)
        }
    }
    // 输出第 m 到第 n 个素数，每行 10 个数，空格分隔
    var count: Int64 = 0
    var result = ""
    for (i in m..=n) {
        count = count + 1
        if (count > 1) {
            // 每 10 个数换行，否则用空格分隔
            if ((count - 1) % 10 == 0) {
                result = result + "\n"
            } else {
                result = result + " "
            }
        }
        result = result + primes[i - 1].toString()
    }
    println(result)
    return 0
}

