import std.env.*
import std.convert.*

// PAT Basic Level 1057 数零壹
// 解题思路：将输入字符串中的字母（不分大小写）映射为序号（A=1, B=2, ..., Z=26）
// 对序号求和后，将和转换为二进制，统计其中 0 和 1 的个数
main() {
    // 读取输入字符串
    let s = getStdIn().readln().getOrThrow()
    
    var sum: Int64 = 0
    // 遍历每个字符，将字母转换为对应序号并累加
    for (ch in s) {
        if (ch >= 97 && ch <= 122) {
            sum += Int64(ch) - 97 + 1  // 小写字母 a~z -> 1~26
        } else if (ch >= 65 && ch <= 90) {
            sum += Int64(ch) - 65 + 1  // 大写字母 A~Z -> 1~26
        }
    }
    
    // 如果和为 0，直接输出 "0 0"
    if (sum == 0) {
        println("0 0")
        return
    }
    
    var cnt0: Int64 = 0  // 二进制中 0 的个数
    var cnt1: Int64 = 0  // 二进制中 1 的个数
    
    // 将 sum 不断除以 2，统计余数中 0 和 1 的个数
    while (sum > 0) {
        if (sum % 2 == 0) {
            cnt0++
        } else {
            cnt1++
        }
        sum = sum / 2
    }
    
    println("${cnt0} ${cnt1}")
}

