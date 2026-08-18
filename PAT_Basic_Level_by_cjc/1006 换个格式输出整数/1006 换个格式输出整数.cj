import std.env.*
import std.convert.*

// 1006 换个格式输出整数
// 解题思路：将三位整数分解为百位、十位、个位，
// 百位用若干个 'B' 表示，十位用若干个 'S' 表示，
// 个位用数字 1~n 的连续序列表示。
main(): Int64 {
    let input = getStdIn().readln().getOrThrow()  // 读取输入的正整数
    let n = Int64.parse(input)
    let bai = n / 100         // 提取百位数字
    let shi = (n / 10) % 10   // 提取十位数字
    let ge = n % 10            // 提取个位数字
    var result = ""
    for (_ in 1..=bai) {      // 输出 bai 个 'B' 表示百位
        result = result + "B"
    }
    for (_ in 1..=shi) {      // 输出 shi 个 'S' 表示十位
        result = result + "S"
    }
    for (i in 1..=ge) {       // 输出 1 到 ge 的数字序列表示个位
        result = result + i.toString()
    }
    println(result)           // 输出格式化结果
    return 0
}

