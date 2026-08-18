// 题目编号：1040 有几个PAT
// 题目名称：有几个PAT
// 解题思路：遍历字符串，对于每个'A'，它左边'P'的个数 × 右边'T'的个数 = 以该'A'为中心的PAT个数。
//           先统计总T数，然后一次遍历中动态维护左边P的个数和右边T的个数，累加结果并对MOD取余。

import std.env.*
import std.convert.*

main() {
    let s = getStdIn().readln().getOrThrow()
    let MOD: Int64 = 1000000007  // 取余数
    let n = s.size
    
    // 第一步：先统计整个字符串中 T 的总数
    var totalT: Int64 = 0
    for (ch in s) {
        if (ch == 84) {  // 字符 'T' 的 ASCII 码
            totalT++
        }
    }
    
    var cntP: Int64 = 0  // 当前遍历位置左边 'P' 的个数
    var cntT = totalT     // 当前遍历位置右边 'T' 的个数
    var result: Int64 = 0
    
    // 第二次遍历，遇到A时计算PAT组合数
    for (ch in s) {
        if (ch == 80) {          // 字符 'P'
            cntP++               // 更新左边P的个数
        } else if (ch == 84) {    // 字符 'T'
            cntT--               // 更新右边T的个数
        } else if (ch == 65) {    // 字符 'A'
            // 以当前A为中心的PAT数量 = 左边P数 × 右边T数
            result = (result + cntP * cntT % MOD) % MOD
        }
    }
    
    println(result)
}