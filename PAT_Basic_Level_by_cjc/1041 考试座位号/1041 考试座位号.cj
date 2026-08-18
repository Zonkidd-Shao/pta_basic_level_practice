// 题目编号：1041 考试座位号
// 题目名称：考试座位号
// 解题思路：使用试机座位号作为索引，建立映射表存储考生号和考试座位号。
//           根据输入的待查询试机座位号，直接通过索引查找并输出对应的考生号和考试座位号。

import std.env.*
import std.convert.*

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    
    // 用数组以试机座位号为索引存储考生信息，座位号范围1~N，最大1000
    var id = Array<String>(1001, item: "")         // 考生号
    var examSeat = Array<Int64>(1001, item: 0)     // 考试座位号
    
    // 读取N个考生的信息
    for (_ in 0..n) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let studentId = parts[0]             // 考生号（16位数字）
        let testSeat = Int64.parse(parts[1]) // 试机座位号
        let examSeatNum = Int64.parse(parts[2]) // 考试座位号
        id[testSeat] = studentId
        examSeat[testSeat] = examSeatNum
    }
    
    // 读取待查询的试机座位号数量
    let m = Int64.parse(getStdIn().readln().getOrThrow())
    let queryLine = getStdIn().readln().getOrThrow()
    let queries = queryLine.split(" ")
    
    // 逐个查询并输出结果
    for (i in 0..m) {
        let seat = Int64.parse(queries[i])
        println("${id[seat]} ${examSeat[seat]}")
    }
}