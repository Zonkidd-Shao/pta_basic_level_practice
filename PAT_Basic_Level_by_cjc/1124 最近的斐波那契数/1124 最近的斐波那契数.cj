// 1124 最近的斐波那契数
// 解题思路：生成斐波那契数列直到超过N，此时N介于a和b之间，比较N与a、b的距离，
// 取距离较小的那个，若距离相等取较小的数。

import std.env.*
import std.convert.*

main() {
    let N = Int64.parse(getStdIn().readln().getOrThrow())  // 输入的正整数

    if (N == 0) {
        println(0)
        return
    }

    var a: Int64 = 0  // F0
    var b: Int64 = 1  // F1

    // 生成斐波那契数列，直到b >= N
    while (b < N) {
        let next = a + b
        a = b
        b = next
    }

    // 此时 a <= N <= b，比较N到a和b的距离
    if (N - a <= b - N) {
        println(a)  // a更近或距离相等（取较小的a）
    } else {
        println(b)  // b更近
    }
}

