import std.env.*
import std.convert.*

// 1078 字符串压缩与解压
// 思路：根据第一行输入的模式（C=压缩/D=解压）对第二行的字符串进行处理。
// 压缩：统计连续相同字符的个数，个数>1时输出数字+字符。
// 解压：遇到数字则解析出完整数字作为重复次数，重复输出后续字符。

main(): Int64 {
    // 读取模式：C表示压缩，D表示解压
    let mode = getStdIn().readln().getOrThrow()
    let s = getStdIn().readln().getOrThrow()

    if (mode == "C") {
        // === 压缩模式 ===
        var i: Int64 = 0
        while (i < s.size) {
            var j = i + 1
            // 找到与s[i]不同的第一个字符位置
            while (j < s.size && s[j] == s[i]) {
                j += 1
            }
            let cnt = j - i  // 连续相同字符的个数
            if (cnt > 1) {
                print(cnt.toString())  // 输出重复次数
            }
            print(Rune(s[i]).toString())      // 输出字符本身
            i = j
        }
        println("")
    } else {
        // === 解压模式 ===
        var i: Int64 = 0
        while (i < s.size) {
            if (s[i] >= 48 && s[i] <= 57) {
                // 遇到数字，解析完整的数字作为重复次数
                var j = i
                while (j < s.size && s[j] >= 48 && s[j] <= 57) {
                    j += 1
                }
                let cnt = Int64.parse(s[i..j])  // 解析数字
                let ch = s[j]                    // 数字后面的字符
                // 按重复次数输出字符
                for (_ in 1..=cnt) {
                    print(Rune(ch).toString())
                }
                i = j + 1
            } else {
                // 普通字符直接输出
                print(Rune(s[i]).toString())
                i += 1
            }
        }
        println("")
    }
    return 0
}
