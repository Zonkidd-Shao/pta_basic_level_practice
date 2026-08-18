import std.env.*
import std.convert.*

// PAT_Basic_Level 1036 跟奥巴马一起编程
// 解题思路：根据列数 N 计算行数 rows = (N+1)/2（四舍五入取整），
// 第一行和最后一行打印 N 个字符，中间行只在两端打印字符，中间输出空格。
main(): Int64 {
    // 读取正方形的边长 N 和组成字符 ch
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let N = Int64.parse(parts[0])
    let ch = parts[1]

    // 计算行数：列数的 50%，四舍五入取整
    let rows = (N + 1) / 2

    // 逐行打印
    for (i in 0..rows) {
        if (i == 0 || i == rows - 1) {
            // 第一行和最后一行：打印 N 个字符
            for (_ in 0..N) {
                Console.stdOut.write(ch)
            }
        } else {
            // 中间行：两端打印字符，中间打印空格
            Console.stdOut.write(ch)
            for (_ in 0..N-2) {
                Console.stdOut.write(" ")
            }
            Console.stdOut.write(ch)
        }
        println("")
    }
    return 0
}

