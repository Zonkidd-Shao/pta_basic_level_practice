import std.env.*
import std.convert.*

// PAT_Basic_Level 1033 旧键盘打字
// 解题思路：用布尔数组标记坏键，`+` 表示上档键（Shift）损坏。
// 遍历待输出的文字，根据坏键情况判断每个字符是否能正常打出。
// 大写字母需要上档键功能和对应键本身都正常才能打出。
main(): Int64 {
    // 读取坏掉的键（第一行）和待输出的文字（第二行）
    let broken = getStdIn().readln().getOrThrow()
    let text = getStdIn().readln().getOrThrow()

    var shiftBroken = false               // 标记上档键 (+) 是否损坏
    var brokenSet = Array<Bool>(256, item: false)  // ASCII 字符集标记坏键

    // 遍历坏键字符串，标记每个坏键
    for (ch in broken) {
        brokenSet[Int64(ch)] = true
        // '+' 的 ASCII 码为 43，代表上档键
        if (ch == 43) {
            shiftBroken = true
        }
    }

    var result = ""
    // 遍历待输出的文字的每个字符
    for (ch in text) {
        if (ch >= 65 && ch <= 90) {
            // 大写字母 (A-Z)：需要上档键和该键本身都正常
            if (shiftBroken || brokenSet[Int64(ch)]) {
                continue  // 无法打出
            }
        } else if (ch >= 97 && ch <= 122) {
            // 小写字母 (a-z)：检查对应大写键是否损坏
            let upperCh = ch - 32
            if (brokenSet[Int64(upperCh)]) {
                continue
            }
        } else {
            // 其他字符：直接检查该字符是否损坏
            if (brokenSet[Int64(ch)]) {
                continue
            }
        }
        result = result + ch.toString()
    }

    // 输出最终能打出的文字
    println(result)
    return 0
}

