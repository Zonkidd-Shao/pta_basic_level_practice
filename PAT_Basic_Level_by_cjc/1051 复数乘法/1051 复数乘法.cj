import std.env.*
import std.convert.*
import std.math.*

// PAT Basic Level 1051 复数乘法
// 解题思路：复数用极坐标形式 (R, P) 表示，即 R*e^(iP)
// 两复数相乘：R1*R2 * e^(i*(P1+P2)) = R1*R2 * (cos(P1+P2) + i*sin(P1+P2))
// 计算结果保留两位小数，需处理正负号和接近零的情况
main() {
    // 读取一行输入，包含 R1、P1、R2、P2 四个值
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    
    // 解析两个复数的极坐标参数
    let r1 = Float64.parse(parts[0])  // 第一个复数的模 R1
    let p1 = Float64.parse(parts[1])  // 第一个复数的辐角 P1（弧度）
    let r2 = Float64.parse(parts[2])  // 第二个复数的模 R2
    let p2 = Float64.parse(parts[3])  // 第二个复数的辐角 P2（弧度）
    
    // 复数乘法：模相乘，辐角相加
    let r = r1 * r2           // 乘积的模
    let angle = p1 + p2       // 乘积的辐角
    var a = r * cos(angle)    // 实部
    var b = r * sin(angle)    // 虚部
    
    // 处理接近零的值：当绝对值小于 0.005 时视为零（避免输出 -0.00）
    if (abs(a) < 0.005) { a = 0.0 }
    if (abs(b) < 0.005) { b = 0.0 }
    
    // 根据虚部正负决定输出格式：a+bi 或 a-bi
    if (b < 0.0) {
        println("${fixed2(a)}-${fixed2(-b)}i")
    } else {
        println("${fixed2(a)}+${fixed2(b)}i")
    }
}

func fixed2(v: Float64): String {
    var negative = v < 0.0
    var x = if (negative) { -v } else { v }
    let scaled = Int64(x * 100.0 + 0.5)
    let whole = scaled / 100
    let frac = scaled % 100
    let body = if (frac < 10) { "${whole}.0${frac}" } else { "${whole}.${frac}" }
    return if (negative && scaled != 0) { "-" + body } else { body }
}
