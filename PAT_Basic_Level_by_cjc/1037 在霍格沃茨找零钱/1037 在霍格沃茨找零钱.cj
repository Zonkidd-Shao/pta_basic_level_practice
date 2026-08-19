import std.env.*
import std.convert.*

// PAT_Basic_Level 1037 在霍格沃茨找零钱
// 解题思路：将应付和实付的金额统一转换为最小单位纳特（Knut）计算，
// 货币换算关系：1 Galleon = 17 Sickle, 1 Sickle = 29 Knut。
// 然后计算差值，再转换回 Galleon.Sickle.Knut 格式输出。
main(): Int64 {
    // 读取一行输入，包含应付 P 和实付 A，格式为 G.S.K
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")

    // 解析应付金额 P 的三个部分
    let pParts = parts[0].split(".")
    let aParts = parts[1].split(".")

    let pG = Int64.parse(pParts[0])
    let pS = Int64.parse(pParts[1])
    let pK = Int64.parse(pParts[2])

    // 解析实付金额 A 的三个部分
    let aG = Int64.parse(aParts[0])
    let aS = Int64.parse(aParts[1])
    let aK = Int64.parse(aParts[2])

    // 将金额统一转换为最小单位纳特（Knut）
    let pTotal = pG * 17 * 29 + pS * 29 + pK
    let aTotal = aG * 17 * 29 + aS * 29 + aK

    // 计算应找零的差值（实付 - 应付）
    let diff = aTotal - pTotal

    // 如果差值为负，输出负号，取绝对值计算
    if (diff < 0) {
        Console.stdOut.write("-")
    }

    let absDiff = abs(diff)
    // 将纳特数转换回 Galleon.Sickle.Knut 格式
    let g = absDiff / (17 * 29)         // 1 Galleon = 17*29 Knut
    let remaining = absDiff % (17 * 29)
    let s = remaining / 29              // 1 Sickle = 29 Knut
    let k = remaining % 29              // 剩余纳特

    // 输出结果
    println("${g}.${s}.${k}")
    return 0
}

// 求绝对值
func abs(x: Int64): Int64 {
    if (x < 0) {
        return -x
    }
    return x
}

