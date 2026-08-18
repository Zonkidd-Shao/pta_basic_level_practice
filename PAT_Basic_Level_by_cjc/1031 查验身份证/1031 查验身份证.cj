import std.env.*
import std.convert.*

// PAT_Basic_Level 1031 查验身份证
// 解题思路：对每个身份证号，先检查前17位是否全为数字，然后根据权重加权求和，
// 将和对11取模得到 Z，与校验码数组中的预期值比对，输出校验失败的号码。
main(): Int64 {
    // 读取身份证号码个数 N
    let N = Int64.parse(getStdIn().readln().getOrThrow())
    // 前17位的权重分配
    let weights = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]
    // Z值对应的校验码映射表
    let checkCodes = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2']

    var allPassed = true  // 标记是否所有号码都有效
    for (_ in 0..N) {
        let id = getStdIn().readln().getOrThrow()
        var sum: Int64 = 0
        var valid = true

        // 遍历前17位，计算加权和
        for (i in 0..17) {
            if (i < 17) {
                // 检查前17位是否都是数字
                if (id[i] >= '0' && id[i] <= '9') {
                    sum += Int64(id[i] - '0') * weights[i]
                } else {
                    valid = false  // 含非数字字符，校验失败
                    break
                }
            }
        }

        if (valid) {
            let z = sum % 11           // 取模得到 Z 值
            let expectedCheck = checkCodes[z]  // 查找预期的校验码
            // 比对第18位校验码是否匹配
            if (id[17] != expectedCheck) {
                valid = false
            }
        }

        // 如果校验失败，输出该身份证号
        if (!valid) {
            println(id)
            allPassed = false
        }
    }

    // 所有号码都通过校验则输出 "All passed"
    if (allPassed) {
        println("All passed")
    }
    return 0
}

