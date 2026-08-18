import std.env.*
import std.convert.*

// PAT_Basic_Level 1027 打印沙漏
// 解题思路：先找出满足 2*h^2 - 1 <= N 的最大层高 h，然后分上（含中间）
// 和下两部分打印沙漏形状，最后打印剩余未使用的符号数。
main(): Int64 {
    // 读取输入：符号总数 N 和使用的字符 ch
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let N = Int64.parse(parts[0])
    let ch = parts[1]

    // 计算最大层高 h：沙漏总符号数 = 2*h^2 - 1
    var h: Int64 = 1
    while (2 * h * h - 1 <= N) {
        h++
    }
    h--  // 回退到最后一个满足条件的 h

    // 计算已使用的符号数和剩余未使用的符号数
    let used = 2 * h * h - 1
    let unused = N - used

    // 打印沙漏上半部分（含中间一行）
    for (i in 0..h) {
        let spaces = i               // 左侧空格数 = 行号
        let chars = 2 * (h - i) - 1  // 当前行符号数 = 2*(h-i)-1
        for (_ in 0..spaces) {
            Console.stdOut.write(" ")
        }
        for (_ in 0..chars) {
            Console.stdOut.write(ch)
        }
        println("")
    }

    // 打印沙漏下半部分（不含中间行）
    for (i in 1..h) {
        let spaces = h - 1 - i      // 左侧空格数递减
        let chars = 2 * i + 1       // 当前行符号数递增
        for (_ in 0..spaces) {
            Console.stdOut.write(" ")
        }
        for (_ in 0..chars) {
            Console.stdOut.write(ch)
        }
        println("")
    }

    // 输出剩余未使用的符号数
    println(unused.toString())
    return 0
}

