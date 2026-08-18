// 题目编号：1111  对称日
// 解题思路：
//   给定多个日期（格式为 "Month Day, Year"），将日期转换为 yyyymmdd 格式的 8 位数字，
//   判断该数字是否为回文数（对称日）。
//   需要处理月份名称到数字的映射、日期和年份的格式补零。

import std.env.*
import std.convert.*

// 将月份英文缩写转换为 2 位数字字符串
func monthToNum(abbr: String): String {
    if (abbr == "Jan") { return "01" }
    else if (abbr == "Feb") { return "02" }
    else if (abbr == "Mar") { return "03" }
    else if (abbr == "Apr") { return "04" }
    else if (abbr == "May") { return "05" }
    else if (abbr == "Jun") { return "06" }
    else if (abbr == "Jul") { return "07" }
    else if (abbr == "Aug") { return "08" }
    else if (abbr == "Sep") { return "09" }
    else if (abbr == "Oct") { return "10" }
    else if (abbr == "Nov") { return "11" }
    else { return "12" }
}

// 判断字符串 s 是否为回文（对称）
func isPalindrome(s: String): Bool {
    var i: Int64 = 0
    var j: Int64 = s.size - 1
    while (i < j) {
        if (s[i] != s[j]) {
            return false                // 首尾字符不相等，不是回文
        }
        i++
        j--
    }
    return true
}

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 日期个数

    for (_ in 0..n) {
        let line = getStdIn().readln().getOrThrow()
        // 输入格式："Month Day, Year"，例如 "Jan 1, 2020"
        let parts = line.split(" ")
        let monthAbbr = parts[0]             // 月份缩写
        let dayStr = parts[1]                // 包含逗号的日期字符串
        // 去掉日期后面的逗号
        let dayEnd = dayStr.size
        let day = dayStr[0..dayEnd - 1]
        let year = parts[2]                  // 年份

        let month = monthToNum(monthAbbr)    // 月份缩写转为 2 位数字

        // 将年份格式化为 4 位（不足前面补 0）
        var yearStr = year
        while (yearStr.size < 4) {
            yearStr = "0" + yearStr
        }

        // 将日格式化为 2 位（不足前面补 0）
        var dayStr2 = day
        while (dayStr2.size < 2) {
            dayStr2 = "0" + dayStr2
        }

        // 拼接成 yyyymmdd 格式的 8 位数字字符串
        let dateStr = yearStr + month + dayStr2

        // 判断并输出结果
        if (isPalindrome(dateStr)) {
            print("Y ")                     // 对称日
        } else {
            print("N ")                     // 非对称日
        }
        println(dateStr)                    // 输出日期字符串
    }
}

