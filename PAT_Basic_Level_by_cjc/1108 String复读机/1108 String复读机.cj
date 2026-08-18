// 题目编号：1108  String复读机
// 解题思路：
//   给定一个字符串，统计其中 'S', 't', 'r', 'i', 'n', 'g' 这 6 个字符的出现次数，
//   然后按照 "String" 的顺序循环输出这些字符，用完为止。
//   （注意大小写：S 大写，其余字母小写）

import std.env.*
import std.convert.*

main() {
    let s = getStdIn().readln().getOrThrow()  // 读取输入字符串

    // 统计 6 个目标字符的出现次数
    var cntS: Int64 = 0   // 字符 'S' 的个数（ASCII 83）
    var cntT: Int64 = 0   // 字符 't' 的个数（ASCII 116）
    var cntR: Int64 = 0   // 字符 'r' 的个数（ASCII 114）
    var cntI: Int64 = 0   // 字符 'i' 的个数（ASCII 105）
    var cntN: Int64 = 0   // 字符 'n' 的个数（ASCII 110）
    var cntG: Int64 = 0   // 字符 'g' 的个数（ASCII 103）

    for (ch in s) {
        // 用 ASCII 码判断字符
        if (ch == 83) { cntS++ }
        else if (ch == 116) { cntT++ }
        else if (ch == 114) { cntR++ }
        else if (ch == 105) { cntI++ }
        else if (ch == 110) { cntN++ }
        else if (ch == 103) { cntG++ }
    }

    // 按 "String" 顺序循环输出，直到所有字符用完
    var result = ""
    while (cntS > 0 || cntT > 0 || cntR > 0 || cntI > 0 || cntN > 0 || cntG > 0) {
        if (cntS > 0) { result += "S"; cntS-- }
        if (cntT > 0) { result += "t"; cntT-- }
        if (cntR > 0) { result += "r"; cntR-- }
        if (cntI > 0) { result += "i"; cntI-- }
        if (cntN > 0) { result += "n"; cntN-- }
        if (cntG > 0) { result += "g"; cntG-- }
    }
    println(result)
}

