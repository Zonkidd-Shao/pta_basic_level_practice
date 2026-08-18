// PAT Basic Level 1014 福尔摩斯的约会
// 解题思路：根据四行字符串的约定规则解密约会信息。
// 前两行：第一个相同的大写字母（A-G）决定星期几；第二个相同的字符（0-9或A-N）决定小时。
// 后两行：第一个相同的英文字母所在位置决定分钟。
import std.env.*
import std.convert.*

// 将大写字母 A-G 映射为星期几的英文缩写
func charToDay(c: Char): String {
    if (c == 'A') { return "MON" }
    if (c == 'B') { return "TUE" }
    if (c == 'C') { return "WED" }
    if (c == 'D') { return "THU" }
    if (c == 'E') { return "FRI" }
    if (c == 'F') { return "SAT" }
    if (c == 'G') { return "SUN" }
    return ""
}

// 将字符映射为小时：0-9 映射为 00-09，A-N 映射为 10-23
func charToHour(c: Char): String {
    if (c >= '0' && c <= '9') {
        return "0" + Int64.parse(c.toString()).toString()
    }
    // A=10, B=11, ..., N=23
    if (c == 'A') { return "10" }
    if (c == 'B') { return "11" }
    if (c == 'C') { return "12" }
    if (c == 'D') { return "13" }
    if (c == 'E') { return "14" }
    if (c == 'F') { return "15" }
    if (c == 'G') { return "16" }
    if (c == 'H') { return "17" }
    if (c == 'I') { return "18" }
    if (c == 'J') { return "19" }
    if (c == 'K') { return "20" }
    if (c == 'L') { return "21" }
    if (c == 'M') { return "22" }
    if (c == 'N') { return "23" }
    return ""
}

// 判断字符是否为英文字母
func isLetter(c: Char): Bool {
    return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')
}

main(): Int64 {
    // 读入四行字符串
    let s1 = getStdIn().readln().getOrThrow()
    let s2 = getStdIn().readln().getOrThrow()
    let s3 = getStdIn().readln().getOrThrow()
    let s4 = getStdIn().readln().getOrThrow()
    var foundDay = false    // 标记是否已找到星期
    var day = ""            // 解密出的星期
    var hour = ""           // 解密出的小时
    // 从第一组字符串中找出星期和小时：遍历到较短字符串的长度
    let minLen1 = if (s1.size < s2.size) { s1.size } else { s2.size }
    for (i in 0..minLen1) {
        let c1 = s1[i]
        let c2 = s2[i]
        if (c1 == c2) {
            if (!foundDay) {
                // 第一个相同的字符必须是 A-G 之间，决定星期
                if (c1 >= 'A' && c1 <= 'G') {
                    day = charToDay(c1)
                    foundDay = true
                }
            } else {
                // 第二个相同的字符（0-9或A-N）决定小时
                let h = charToHour(c1)
                if (h.size > 0) {
                    hour = h
                    break
                }
            }
        }
    }
    // 从第二组字符串中找出分钟：第一个相同英文字母的索引位置即为分钟
    var minute: Int64 = 0
    let minLen2 = if (s3.size < s4.size) { s3.size } else { s4.size }
    for (i in 0..minLen2) {
        let c1 = s3[i]
        let c2 = s4[i]
        if (c1 == c2 && isLetter(c1)) {
            minute = i
            break
        }
    }
    // 分钟不足两位时补零
    let minuteStr = if (minute < 10) { "0" + minute.toString() } else { minute.toString() }
    println("${day} ${hour}:${minuteStr}")
    return 0
}

