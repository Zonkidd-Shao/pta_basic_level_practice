import std.env.*
import std.convert.*

// 1011 A+B 和 C
// 解题思路：给定 T 组测试用例，每组给出 A、B、C 三个整数，
// 判断 A + B 是否大于 C，按格式 "Case #X: true/false" 输出结果。
main(): Int64 {
    let t = Int64.parse(getStdIn().readln().getOrThrow())  // 读取测试用例个数
    for (i in 1..=t) {
        let line = getStdIn().readln().getOrThrow()        // 读取一行 A B C
        let parts = line.split(" ")
        let a = Int64.parse(parts[0])
        let b = Int64.parse(parts[1])
        let c = Int64.parse(parts[2])
        if (a + b > c) {                          // 判断 A+B 是否大于 C
            println("Case #${i}: true")
        } else {
            println("Case #${i}: false")
        }
    }
    return 0
}

