import std.env.*
import std.convert.*

// PAT Basic Level 1054 求平均值
// 解题思路：读取 N 个字符串，逐个验证是否为合法实数
// 合法条件：最多一个小数点、小数点后最多两位、范围在 [-1000, 1000]
// 对合法数字求平均值并按要求输出
// 检查字符串是否为合法数字
func isValidNumber(s: String): Bool {
    // 字符串不能为空
    if (s.size == 0) { return false }
    
    // 检查首字符：必须是 +/-/数字
    let first = s[0]
    if (first != 45 && first != 43 && !(first >= 48 && first <= 57)) {
        return false
    }
    
    // 只有一个正负号不合法
    if ((first == 45 || first == 43) && s.size == 1) {
        return false
    }
    
    var dotCount: Int64 = 0       // 小数点个数
    var digitAfterDot: Int64 = 0  // 小数点后的数字位数
    var afterDot = false          // 是否已进入小数部分
    
    // 从第 2 个字符开始逐个检查
    for (i in 1..s.size) {
        let ch = s[i]
        if (ch == 46) {            // '.' 的 ASCII 码为 46
            dotCount++
            if (dotCount > 1) { return false }  // 多余一个小数点不合法
            afterDot = true
        } else if (ch >= 48 && ch <= 57) {  // 数字字符
            if (afterDot) {
                digitAfterDot++
                if (digitAfterDot > 2) { return false }  // 小数位数超过 2 不合法
            }
        } else {
            return false  // 出现非法字符
        }
    }
    
    // 检查数值范围是否在 [-1000, 1000] 之间
    let val = Float64.parse(s)
    if (val < -1000.0 || val > 1000.0) {
        return false
    }
    
    return true
}

main() {
    // 读取数字个数 N
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    // 读取一行包含 N 个数字字符串
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    
    var sum: Float64 = 0.0  // 合法数字的总和
    var cnt: Int64 = 0      // 合法数字的个数
    
    // 遍历每个字符串，累加合法数字
    for (i in 0..n) {
        let s = parts[i]
        if (isValidNumber(s)) {
            sum += Float64.parse(s)
            cnt++
        } else {
            println("ERROR: ${s} is not a legal number")
        }
    }
    
    // 根据合法数字个数输出平均值（注意单复数和特殊格式）
    if (cnt == 0) {
        println("The average of 0 numbers is Undefined")
    } else if (cnt == 1) {
        println("The average of 1 number is ${(sum / Float64(cnt)).format("0.00")}")
    } else {
        println("The average of ${cnt} numbers is ${(sum / Float64(cnt)).format("0.00")}")
    }
}

