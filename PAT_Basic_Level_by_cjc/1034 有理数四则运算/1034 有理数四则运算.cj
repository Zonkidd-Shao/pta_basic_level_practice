import std.env.*
import std.convert.*

// PAT_Basic_Level 1034 有理数四则运算
// 解题思路：定义 Fraction 类表示分数，实现 gcd 求最大公约数用于约分。
// 分别计算两个有理数的和、差、积、商，并用 printFormatted 函数
// 将结果格式化为带分数形式（如 k a/b）或加括号的负数形式输出。
class Fraction {
    var num: Int64   // 分子
    var den: Int64   // 分母

    init(num: Int64, den: Int64) {
        this.num = num
        this.den = den
    }
}

main(): Int64 {
    // 读取一行输入，包含两个分数 a1/b1 a2/b2
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")

    let f1Parts = parts[0].split("/")
    let f2Parts = parts[1].split("/")

    // 解析两个分数的分子和分母
    let f1 = Fraction(Int64.parse(f1Parts[0]), Int64.parse(f1Parts[1]))
    let f2 = Fraction(Int64.parse(f2Parts[0]), Int64.parse(f2Parts[1]))

    // 加法：a1/b1 + a2/b2 = (a1*b2 + a2*b1) / (b1*b2)
    let addNum = f1.num * f2.den + f2.num * f1.den
    let addDen = f1.den * f2.den
    printFormatted(f1)
    print(" + ")
    printFormatted(f2)
    print(" = ")
    printFormatted(Fraction(addNum, addDen))
    println("")

    // 减法：a1/b1 - a2/b2 = (a1*b2 - a2*b1) / (b1*b2)
    let subNum = f1.num * f2.den - f2.num * f1.den
    let subDen = f1.den * f2.den
    printFormatted(f1)
    print(" - ")
    printFormatted(f2)
    print(" = ")
    printFormatted(Fraction(subNum, subDen))
    println("")

    // 乘法：a1/b1 * a2/b2 = (a1*a2) / (b1*b2)
    let mulNum = f1.num * f2.num
    let mulDen = f1.den * f2.den
    printFormatted(f1)
    print(" * ")
    printFormatted(f2)
    print(" = ")
    printFormatted(Fraction(mulNum, mulDen))
    println("")

    // 除法：a1/b1 / a2/b2 = (a1*b2) / (b1*a2)
    printFormatted(f1)
    print(" / ")
    printFormatted(f2)
    print(" = ")
    if (f2.num == 0) {
        // 除数为 0 时输出 Inf
        println("Inf")
    } else {
        let divNum = f1.num * f2.den
        let divDen = f1.den * f2.num
        // 确保分母为正，将负号移到分子
        if (divDen < 0) {
            printFormatted(Fraction(-divNum, -divDen))
        } else {
            printFormatted(Fraction(divNum, divDen))
        }
        println("")
    }

    return 0
}

// 求最大公约数（辗转相除法）
func gcd(a: Int64, b: Int64): Int64 {
    var x = abs(a)
    var y = abs(b)
    while (y != 0) {
        let tmp = x % y
        x = y
        y = tmp
    }
    return x
}

// 求绝对值
func abs(x: Int64): Int64 {
    if (x < 0) {
        return -x
    }
    return x
}

// 格式化输出分数：约分后转为带分数形式，负数加括号
func printFormatted(f: Fraction) {
    // 分母为 0 输出 Inf
    if (f.den == 0) {
        print("Inf")
        return
    }

    // 分子为 0 输出 0
    if (f.num == 0) {
        print("0")
        return
    }

    var num = f.num
    var den = f.den
    var negative = false
    // 处理负号，统一约分时用正数计算
    if (num < 0) {
        negative = !negative
        num = -num
    }
    if (den < 0) {
        negative = !negative
        den = -den
    }

    // 约分：分子分母除以最大公约数
    let g = gcd(num, den)
    num = num / g
    den = den / g

    // 将假分数转为带分数：整数部分和余数部分
    let intPart = num / den
    let remainder = num % den

    // 负数加括号
    if (negative) {
        print("(-")
    }

    // 输出带分数：整数部分 + 分数部分（如有）
    if (intPart != 0) {
        print(intPart.toString())
        if (remainder != 0) {
            print(" ${remainder}/${den}")
        }
    } else {
        // 只有分数部分
        print("${remainder}/${den}")
    }

    // 关闭括号
    if (negative) {
        print(")")
    }
}

