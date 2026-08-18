import std.env.*
import std.convert.*

// PAT_Basic_Level 1026 程序运行时间
// 解题思路：根据两个时钟打点数之差 (C2-C1) 计算运行时间。
// CLK_TCK = 100，四舍五入到秒后换算为 hh:mm:ss 格式输出。
main(): Int64 {
    // 读取一行输入，包含两个整数 C1 和 C2
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let C1 = Int64.parse(parts[0])
    let C2 = Int64.parse(parts[1])

    // 计算时钟打点数的差值
    let diff = C2 - C1
    // 四舍五入到最近的秒数：加上 50 再除以 100 实现四舍五入
    var totalSeconds = (diff + 50) / 100

    // 将总秒数转换为 hh:mm:ss 格式
    let hh = totalSeconds / 3600       // 小时：1小时 = 3600秒
    let mm = (totalSeconds % 3600) / 60  // 分钟：1分钟 = 60秒
    let ss = totalSeconds % 60           // 秒

    // 按 %02d:%02d:%02d 格式输出，不足2位补前导零
    println(String.format("%02d:%02d:%02d", hh, mm, ss))
    return 0
}

