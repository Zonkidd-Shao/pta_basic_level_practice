// 题目编号：1042 字符统计
// 题目名称：字符统计
// 解题思路：遍历字符串，统计每个英文字母（不区分大小写）出现的次数存入数组；
//           然后找出出现次数最多的字母，若有并列则取字母序最小的那个，最后输出小写字母及其次数。

import std.env.*
import std.convert.*

main() {
    let s = getStdIn().readln().getOrThrow()
    
    // 计数数组，下标0~25对应字母a~z
    var cnt = Array<Int64>(26, item: 0)
    
    // 遍历字符串，统计英文字母出现次数（不区分大小写）
    for (ch in s) {
        if (ch >= 97 && ch <= 122) {          // 小写字母 a~z
            cnt[Int64(ch) - 97]++
        } else if (ch >= 65 && ch <= 90) {    // 大写字母 A~Z，转换为小写统计
            cnt[Int64(ch) - 65]++
        }
    }
    
    var maxCnt: Int64 = 0  // 最大出现次数
    var maxIdx: Int64 = 0  // 出现次数最多的字母索引
    
    // 遍历计数数组，找出出现次数最多的字母
    // 由于按顺序遍历，出现次数相同时自动保留字母序较小的
    for (i in 0..26) {
        if (cnt[i] > maxCnt) {
            maxCnt = cnt[i]
            maxIdx = i
        }
    }
    
    // 将数组索引（0~25）转换为对应的小写字母
    let resultChar = (97 + maxIdx).toRune()
    println("${resultChar} ${maxCnt}")
}