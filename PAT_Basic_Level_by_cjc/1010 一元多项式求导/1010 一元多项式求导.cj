import std.env.*
import std.convert.*

// 1010 一元多项式求导
// 解题思路：输入以"系数 指数"成对形式给出多项式非零项，
// 对每对 (coeff, exp)，求导后新系数 = coeff * exp，新指数 = exp - 1。
// 常数项（指数为 0）求导后为 0，不输出。
// 如果所有项都是常数项（输出为空），则输出 "0 0"。
main(): Int64 {
    let line = getStdIn().readln().getOrThrow()  // 读取多项式系数和指数
    let parts = line.split(" ")
    let len = parts.size
    var result = ""
    var i: Int64 = 0
    while (i < len) {
        let coeff = Int64.parse(parts[i])      // 系数
        let exp = Int64.parse(parts[i + 1])    // 指数
        if (exp != 0) {                        // 指数为 0 的是常数项，求导后为 0，跳过
            let newCoeff = coeff * exp          // 求导后的新系数
            let newExp = exp - 1                // 求导后的新指数
            if (result.size > 0) {
                result = result + " "           // 非首项前加空格
            }
            result = result + newCoeff.toString() + " " + newExp.toString()
        }
        i = i + 2                               // 每对系数-指数占两个位置
    }
    if (result.size == 0) {                     // 零多项式，输出 "0 0"
        result = "0 0"
    }
    println(result)                             // 输出求导结果
    return 0
}

