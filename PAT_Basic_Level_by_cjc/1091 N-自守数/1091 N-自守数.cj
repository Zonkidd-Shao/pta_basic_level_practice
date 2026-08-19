// 1091 N-自守数
// 解题思路：对每个给定的 K，在 N=1~9 范围内查找 N×K² 的末尾 K 位是否等于 K，
// 若找到则输出 N 和乘积，否则输出 "No"。
import std.env.*
import std.convert.*

main() {
    // 读取待检测数字的个数 M
    var M = Int64.parse(getStdIn().readln().getOrThrow())
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    // 依次处理每个数字 K
    for (i in 0..M) {
        var K = Int64.parse(parts[Int64(i)])
        var found = false
        // N 的取值范围为 1~9（题目限定）
        for (N in 1..10) {
            var prod = N * K * K  // 计算 N × K²
            var s = prod.toString()
            var ks = K.toString()
            // 检查乘积的末尾是否与 K 相等（即 K 是 N×K² 的尾数）
            if (s.size >= ks.size && s[s.size - ks.size..] == ks) {
                println("${N} ${prod}")
                found = true
                break
            }
        }
        if (!found) {
            println("No")
        }
    }
}

