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
    var arr = Array<Rune>(s.size)
    var idx = 0
    for (i in s.size - 1..0) {
        arr[idx] = s[i]
        idx++
    }
    var rs = ""
    for (c in arr) {
        rs += c.toString()
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
            da = Int64.parse(a[i].toString())
        if (j >= 0) {
            db = Int64.parse(b[j].toString())
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
    // 最多迭代10步
    for (step in 0..10) {
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
    }
    if (!found) {
        println("Not found in 10 iterations.")
    }
}