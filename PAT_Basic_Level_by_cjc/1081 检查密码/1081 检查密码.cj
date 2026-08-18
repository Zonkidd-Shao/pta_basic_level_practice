import std.env.*
import std.convert.*

// 1081 检查密码
// 思路：检查密码长度是否>=6，是否只包含合法字符（字母、数字、小数点），
// 是否同时包含字母和数字，根据不同的违规情况输出相应提示信息。

// 检查单个密码的合法性
func checkPassword(pwd: String) {
    var len = pwd.size
    // 密码长度必须>=6
    if (len < 6) {
        println("Your password is tai duan le.")
        return
    }
    var hasLetter = false  // 是否包含字母
    var hasDigit = false   // 是否包含数字
    var valid = true       // 是否只包含合法字符
    for (c in pwd) {
        if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
            hasLetter = true
        } else if (c >= '0' && c <= '9') {
            hasDigit = true
        } else if (c == '.') {
            // 小数点也是合法字符
        } else {
            // 遇到非法字符
            valid = false
            break
        }
    }
    // 包含非法字符
    if (!valid) {
        println("Your password is tai luan le.")
        return
    }
    // 缺少字母
    if (!hasLetter) {
        println("Your password needs zi mu.")
        return
    }
    // 缺少数字
    if (!hasDigit) {
        println("Your password needs shu zi.")
        return
    }
    // 密码完全合法
    println("Your password is wan mei.")
}

main() {
    var N = Int64.parse(getStdIn().readln().getOrThrow())  // 读取密码个数
    for (_ in 0..N) {
        var pwd = getStdIn().readln().getOrThrow()  // 读取每个密码
        checkPassword(pwd)
    }
}