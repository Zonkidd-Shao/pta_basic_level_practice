import std.env.*
import std.convert.*

// PAT_Basic_Level 1029 旧键盘
// 解题思路：比较原始输入和实际输出，找出那些在原始输入中出现但在实际输出中
// 缺失的字符（即坏掉的键）。将小写字母转为大写后去重输出。
main(): Int64 {
    // 读取原始输入字符串和实际被打印出的字符串
    let original = getStdIn().readln().getOrThrow()
    let typed = getStdIn().readln().getOrThrow()

    var result = ""       // 存储已发现的坏键（已转为大写，去重）
    var j: Int64 = 0      // typed 字符串的指针
    let oLen = original.size
    let tLen = typed.size

    // 遍历原始输入的每个字符
    for (i in 0..oLen) {
        // 如果当前字符被成功输出，则移动 typed 指针
        if (j < tLen && original[i] == typed[j]) {
            j++
        } else {
            // 该字符未被输出（坏键），提取并转为大写
            let ch = original[i]
            var upperCh = ch
            // 小写字母转大写（ASCII 差值 32）
            if (ch >= 97 && ch <= 122) {
                upperCh = ch - 32
            }
            // 检查该坏键是否已记录在 result 中（去重）
            var found = false
            for (k in 0..result.size) {
                if (result[k] == upperCh) {
                    found = true
                    break
                }
            }
            // 未重复则添加到结果字符串
            if (!found) {
                result = result + Rune(upperCh).toString()
            }
        }
    }

    // 输出所有坏掉的键（大写）
    println(result)
    return 0
}
