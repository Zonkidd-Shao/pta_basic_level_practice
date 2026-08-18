import std.env.*
import std.convert.*

// PAT_Basic_Level 1028 人口普查
// 解题思路：读取 N 个人的姓名和出生日期，筛选出在 [1814/09/06, 2014/09/06]
// 范围内的有效生日，找出其中最年长（日期最小）和最年轻（日期最大）的人。
// 由于日期格式为 yyyy/mm/dd，可直接用字符串比较大小。
main(): Int64 {
    // 读取总人数 N
    let N = Int64.parse(getStdIn().readln().getOrThrow())

    // 设置合法生日的上下界
    let minDate = "1814/09/06"
    let maxDate = "2014/09/06"

    var validCount: Int64 = 0     // 有效生日计数器
    var oldestName = ""            // 最年长者姓名
    var youngestName = ""          // 最年轻者姓名
    var oldestDate = maxDate       // 最年长者的日期（初始为最大日期）
    var youngestDate = minDate     // 最年轻者的日期（初始为最小日期）

    // 遍历每个人
    for (_ in 0..N) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let name = parts[0]
        let date = parts[1]

        // 判断生日是否在合法范围内
        if (date >= minDate && date <= maxDate) {
            validCount++
            // 日期越小表示出生越早，更新最年长者
            if (date < oldestDate) {
                oldestDate = date
                oldestName = name
            }
            // 日期越大表示出生越晚，更新最年轻者
            if (date > youngestDate) {
                youngestDate = date
                youngestName = name
            }
        }
    }

    // 输出结果：如果无有效生日则只输出 0
    if (validCount == 0) {
        println("0")
    } else {
        println("${validCount} ${oldestName} ${youngestName}")
    }
    return 0
}

