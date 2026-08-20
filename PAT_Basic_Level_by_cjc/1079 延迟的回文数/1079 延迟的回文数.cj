import std.env.*
import std.convert.*

// 1079 延迟的回文数
// 思路：判断一个数是否为回文数，如果不是则将其与逆转数相加，
// 重复此过程直到得到回文数（最多10步）。由于数字可能长达1000位，
// 需要用字符串实现大数加法。

// 判断字符串s是否为回文数
func isPalindrome(s: String): Bool {
    var i = 0
    var j = s.size - 1
    while (i < j) {
        if (s[i] != s[j]) {
            return false
        }
        i++
        j--
    }
    return true
}

// 将数字字符串s逆转
func reverseStr(s: String): String {
    var rs = ""
    var i = s.size - 1
    while (i >= 0) {
        rs += Rune(s[i]).toString()
        i--
    }
    return rs
}

// 大数加法：将两个数字字符串逐位相加，返回结果字符串
func addBig(a: String, b: String): String {
    var carry = 0      // 进位
    var i = a.size - 1 // 从个位开始逐位相加
    var j = b.size - 1
    var result = ""
    while (i >= 0 || j >= 0 || carry > 0) {
        var da = 0
        var db = 0
        if (i >= 0) {
            da = Int64(a[i]) - 48
        }
        if (j >= 0) {
            db = Int64(b[j]) - 48
        }
        var sum = da + db + carry
        carry = sum / 10          // 计算进位
        result = (sum % 10).toString() + result  // 当前位的结果拼接到前面
        i--
        j--
    }
    return result
}

main() {
    var s = getStdIn().readln().getOrThrow()  // 读取输入的正整数
    var found = false
    // 检查初始值以及每次加法后的结果，最多执行10次加法。
    var step = 0
    while (step <= 10) {
        if (isPalindrome(s)) {
            println("${s} is a palindromic number.")
            found = true
            break
        }
        if (step == 10) {
            break
        }
        var rev = reverseStr(s)    // 计算逆转数
        var sum = addBig(s, rev)   // 原数 + 逆转数
        println("${s} + ${rev} = ${sum}")
        s = sum                    // 更新为和，继续下一轮
        step++
    }
    if (!found) {
        println("Not found in 10 iterations.")
    }
}
