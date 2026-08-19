// PAT Basic Level 1022 D进制的A+B
// 解题思路：先计算 A+B 的和，然后用除基取余法将和转换为 D 进制数。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入 A、B 和进制 D
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let A = Int64.parse(parts[0])
    let B = Int64.parse(parts[1])
    let D = Int64.parse(parts[2])

    var sum = A + B
    // 如果和为 0，直接输出 0
    if (sum == 0) {
        println("0")
        return 0
    }

    // 除基取余法：依次取 sum 除以 D 的余数，逆序拼接得到 D 进制结果
    var result = ""
    while (sum > 0) {
        result = (sum % D).toString() + result  // 余数放在前面（逆序拼接）
        sum = sum / D
    }

    println(result)
    return 0
}

