// PAT Basic Level 1016 部分A+B
// 解题思路：将字符串 A 中所有等于 DA 的数字提取出来组成新数 PA，
// 同理从 B 和 DB 得到 PB，计算 PA + PB。
import std.env.*
import std.convert.*

// 统计字符串 s 中数字 d 出现的次数
func countDigit(s: String, d: String): Int64 {
    var count: Int64 = 0
    for (ch in s) {
        if (ch.toString() == d) {
            count = count + 1
        }
    }
    return count
}

// 用数字 d 重复 count 次构建一个整数（如 d=3, count=4 → 3333）
func buildNum(d: String, count: Int64): Int64 {
    var result: Int64 = 0
    let digit = Int64.parse(d)
    for (_ in 1..=count) {
        result = result * 10 + digit
    }
    return result
}

main(): Int64 {
    // 输入格式：A DA B DB
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let a = parts[0]
    let da = parts[1]
    let b = parts[2]
    let db = parts[3]
    // 分别统计 DA 在 A 中、DB 在 B 中出现的次数，并构建对应的数字
    let countA = countDigit(a, da)
    let countB = countDigit(b, db)
    let pa = buildNum(da, countA)
    let pb = buildNum(db, countB)
    // 输出 PA + PB 的结果
    println(pa + pb)
    return 0
}

