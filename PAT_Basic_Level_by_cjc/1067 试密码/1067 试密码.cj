// PAT-Basic-1067 试密码
// 解题思路：先读取正确密码和最大尝试次数 N。然后逐行读取用户输入，
// 匹配密码并统计尝试次数，超过 N 次错误则锁定账户，输入 "#" 则结束。
import std.env.*
import std.convert.*

main(): Int64 {
    let first = getStdIn().readln().getOrThrow()
    // 将第一行拆分为密码和最大尝试次数 N
    let spaceIdx = first.find(" ")
    if (spaceIdx == nil) {
        return 0
    }
    let idx = spaceIdx.getOrThrow()
    let password = first[0..idx]          // 正确密码
    let n = Int64.parse(first[idx + 1..]) // 最大尝试次数

    var attempts: Int64 = 0  // 已尝试次数
    while (true) {
        let input = getStdIn().readln().getOrThrow()
        // 遇到 "#" 表示输入结束
        if (input == "#") {
            break
        }
        attempts += 1
        // 密码正确，欢迎登录
        if (input == password && attempts <= n) {
            println("Welcome in")
            return 0
        // 密码错误，输出错误提示
        } else if (input != password && attempts <= n) {
            println("Wrong password: ${input}")
            // 达到最大尝试次数，锁定账户
            if (attempts == n) {
                println("Account locked")
                return 0
            }
        }
    }
    return 0
}

