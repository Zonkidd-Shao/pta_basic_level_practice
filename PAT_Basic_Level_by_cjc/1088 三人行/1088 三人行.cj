// 1088 三人行
// 解题思路：甲是2位数，乙是甲的数字反转，丙满足 |甲-乙| = 丙×X 且 乙 = 丙×Y。
// 从大到小遍历甲（99→9），找到第一个满足条件的解，然后比较M与甲、乙、丙的关系。
import std.env.*
import std.convert.*

// 比较整数 v 与 M 的大小关系，返回 "Cong"(大于)、"Ping"(等于) 或 "Gai"(小于)
func compareInt(m: Int64, v: Int64): String {
    if (v > m) {
        return "Cong"
    } else if (v == m) {
        return "Ping"
    } else {
        return "Gai"
    }
}

// 比较浮点数 v 与 M 的大小关系
func compareFloat(m: Int64, v: Float64): String {
    if (v > Float64(m)) {
        return "Cong"
    } else if (v == Float64(m)) {
        return "Ping"
    } else {
        return "Gai"
    }
}

main() {
    // 读取 M（自身能力值）、X 和 Y
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var M = Int64.parse(parts[0])
    var X = Int64.parse(parts[1])
    var Y = Int64.parse(parts[2])

    var found = false
    var jia: Int64 = 0
    var yi: Int64 = 0
    var bing: Float64 = 0.0
    // 甲是2位数，从大到小（99到9）遍历，确保解是甲的最大值
    for (a in 99..9) {
        var b = (a % 10) * 10 + a / 10  // 乙是甲的数字反转
        var diff = if (a > b) a - b else b - a  // 甲乙之差的绝对值
        // 由 |甲-乙| = 丙×X 和 乙 = 丙×Y 推导出：乙×X = |甲-乙|×Y
        // 即 b * X == diff * Y
        if (b * X == diff * Y) {
            jia = a
            yi = b
            bing = Float64(diff) / Float64(X)  // 丙 = |甲-乙| / X
            found = true
            break
        }
    }
    if (!found) {
        println("No Solution")
    } else {
        // 输出甲的能力值，以及甲、乙、丙分别与M的比较结果
        Console.stdOut.write(jia.toString())
        Console.stdOut.write(" " + compareInt(M, jia))
        Console.stdOut.write(" " + compareInt(M, yi))
        Console.stdOut.write(" " + compareFloat(M, bing))
        println("")
    }
}

