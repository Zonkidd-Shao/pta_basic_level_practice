import std.env.*
import std.convert.*

// 1012 数字分类
// 解题思路：遍历 N 个正整数，根据每个数除以 5 的余数进行分类统计：
// A1: 能被 5 整除的偶数之和
// A2: 余 1 的数字交错求和（加、减交替）
// A3: 余 2 的数字个数
// A4: 余 3 的数字平均值（精确到小数点后 1 位）
// A5: 余 4 的数字中的最大值
// 若某类不存在数字，输出 "N"。
main(): Int64 {
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let n = Int64.parse(parts[0])  // 第一个数字是 N，表示后续数字的个数
    var a1: Int64 = 0
    var a1Exist = false        // 标记 A1 类是否有数字
    var a2: Int64 = 0
    var a2Count: Int64 = 0     // A2 类数字的个数（用于判断是否存在）
    var a3: Int64 = 0
    var a4Sum: Int64 = 0       // A4 类数字的总和
    var a4Count: Int64 = 0     // A4 类数字的个数
    var a5: Int64 = 0
    var a5Exist = false        // 标记 A5 类是否有数字
    var sign: Int64 = 1        // 交错求和的符号，初始为 +，每次交替变号

    for (i in 1..=n) {
        let x = Int64.parse(parts[i])
        let r = x % 5           // 计算除以 5 的余数，用于分类
        if (r == 0 && x % 2 == 0) {   // A1: 能被 5 整除且为偶数
            a1 = a1 + x
            a1Exist = true
        } else if (r == 1) {          // A2: 余 1，交错求和
            a2 = a2 + sign * x
            sign = -sign              // 每次交替变号
            a2Count = a2Count + 1
        } else if (r == 2) {          // A3: 余 2，统计个数
            a3 = a3 + 1
        } else if (r == 3) {          // A4: 余 3，累加和及计数
            a4Sum = a4Sum + x
            a4Count = a4Count + 1
        } else if (r == 4) {          // A5: 余 4，找最大值
            if (!a5Exist || x > a5) {
                a5 = x
                a5Exist = true
            }
        }
    }

    var result = ""
    // A1
    if (a1Exist) {
        result = result + a1.toString()
    } else {
        result = result + "N"
    }
    // A2
    result = result + " "
    if (a2Count > 0) {
        result = result + a2.toString()
    } else {
        result = result + "N"
    }
    // A3
    result = result + " "
    if (a3 > 0) {
        result = result + a3.toString()
    } else {
        result = result + "N"
    }
    // A4 — 计算平均值，精确到小数点后 1 位
    result = result + " "
    if (a4Count > 0) {
        let avg = (a4Sum * 10 + a4Count / 2) / a4Count   // 四舍五入到一位小数
        result = result + (avg / 10).toString() + "." + (avg % 10).toString()
    } else {
        result = result + "N"
    }
    // A5
    result = result + " "
    if (a5Exist) {
        result = result + a5.toString()
    } else {
        result = result + "N"
    }
    println(result)  // 输出 A1~A5 的分类结果
    return 0
}

