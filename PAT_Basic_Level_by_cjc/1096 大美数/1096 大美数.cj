// 1096 大美数
// 解题思路：对每个正整数 N，找出其所有因数，然后枚举所有4个因数的组合，
// 检查是否存在一组因数的和能被 N 整除。
import std.env.*
import std.convert.*
import std.collection.*

main() {
    // 读取待检测数字的个数 K
    var K = Int64.parse(getStdIn().readln().getOrThrow())
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    // 依次处理每个数字 N
    for (i in 0..K) {
        var N = Int64.parse(parts[Int64(i)])
        // 找出 N 的所有因数
        var divisors = ArrayList<Int64>()
        for (d in 1..(N + 1)) {
            if (N % d == 0) {
                divisors.add(d)
            }
        }
        var sz = divisors.size
        var found = false
        // 枚举所有4个因数的组合（C(sz, 4)）
        for (a in 0..sz) {
            for (b in (a + 1)..sz) {
                for (c in (b + 1)..sz) {
                    for (d in (c + 1)..sz) {
                        var sum = divisors[a] + divisors[b] + divisors[c] + divisors[d]
                        // 检查4个因数之和是否能被 N 整除
                        if (sum % N == 0) {
                            found = true
                            break
                        }
                    }
                    if (found) { break }
                }
                if (found) { break }
            }
            if (found) { break }
        }
        // 输出结果
        if (found) {
            println("Yes")
        } else {
            println("No")
        }
    }
}

