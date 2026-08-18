// 题目编号：1043 输出PATest
// 题目名称：输出PATest
// 解题思路：统计字符串中字符P、A、T、e、s、t各自出现的次数；
//           按"PATest"的顺序循环输出，每轮依次输出这6个字符中仍有剩余的字符，直到全部输出完毕。

import std.env.*
import std.convert.*

main() {
    let s = getStdIn().readln().getOrThrow()
    
    // 统计6个目标字符的出现次数，分别对应 P、A、T、e、s、t
    var cntP: Int64 = 0
    var cntA: Int64 = 0
    var cntT: Int64 = 0
    var cnte: Int64 = 0
    var cnts: Int64 = 0
    var cntt: Int64 = 0
    
    // 遍历字符串，统计各字符出现次数
    for (ch in s) {
        if (ch == 80) { cntP++ }       // 'P' ASCII=80
        else if (ch == 65) { cntA++ }  // 'A' ASCII=65
        else if (ch == 84) { cntT++ }  // 'T' ASCII=84
        else if (ch == 101) { cnte++ } // 'e' ASCII=101
        else if (ch == 115) { cnts++ } // 's' ASCII=115
        else if (ch == 116) { cntt++ } // 't' ASCII=116
    }
    
    var sb = ""  // 用于拼接输出结果
    
    // 循环输出，直到所有字符都输出完毕
    while (cntP > 0 || cntA > 0 || cntT > 0 || cnte > 0 || cnts > 0 || cntt > 0) {
        // 每轮按 PATest 的顺序依次输出，有剩余的就输出一个
        if (cntP > 0) { sb += "P"; cntP-- }
        if (cntA > 0) { sb += "A"; cntA-- }
        if (cntT > 0) { sb += "T"; cntT-- }
        if (cnte > 0) { sb += "e"; cnte-- }
        if (cnts > 0) { sb += "s"; cnts-- }
        if (cntt > 0) { sb += "t"; cntt-- }
    }
    
    println(sb)
}