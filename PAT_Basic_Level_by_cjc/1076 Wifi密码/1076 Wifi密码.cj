import std.env.*
import std.convert.*

// 1076 Wifi密码
// 思路：每行有4个选项，找到标记为'T'的正确选项，
// 根据选项字母(A/B/C/D)映射为数字(1/2/3/4)，拼接成密码输出。

main(): Int64 {
    // 读取题目数量N
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    var result = ""  // 用于拼接密码结果
    for (_ in 1..=n) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")  // 分割出4个选项，如"A-T"
        for (opt in parts) {
            // 检查选项字符串的第3个字符（索引2）是否为'T'，即正确答案标记
            if (opt[2] == 'T') {
                let choice = opt[0]
                // 将选项字母转换为对应的数字
                if (choice == 'A') { result += "1" }
                else if (choice == 'B') { result += "2" }
                else if (choice == 'C') { result += "3" }
                else if (choice == 'D') { result += "4" }
            }
        }
    }
    println(result)  // 输出wifi密码
    return 0
}