// 题目编号：1039 到底买不买
// 题目名称：到底买不买
// 解题思路：统计摊主珠串（seller）和小红想要的珠串（buyer）中每个字符的出现次数，
//           对比两个计数数组，计算多余或缺少的珠子数量。若缺少为0则输出Yes+多余数，否则输出No+缺少数。

import std.env.*
import std.convert.*

main() {
    // 读取摊主的珠串和小红想做的珠串
    let seller = getStdIn().readln().getOrThrow()
    let buyer = getStdIn().readln().getOrThrow()
    
    // 用ASCII码表大小的数组统计每个字符出现次数，初始为0
    var sellCnt = Array<Int64>(128, item: 0)
    var buyCnt = Array<Int64>(128, item: 0)
    
    // 统计摊主珠串中各字符的数量
    for (ch in seller) {
        sellCnt[Int64(ch)]++
    }
    // 统计小红想要珠串中各字符的数量
    for (ch in buyer) {
        buyCnt[Int64(ch)]++
    }
    
    // 多余珠子数 和 缺少珠子数
    var extra: Int64 = 0
    var missing: Int64 = 0
    
    // 遍历所有ASCII字符，对比摊主和小红的需求
    for (i in 0..128) {
        if (sellCnt[i] >= buyCnt[i]) {
            extra += sellCnt[i] - buyCnt[i]  // 摊主多出的珠子
        } else {
            missing += buyCnt[i] - sellCnt[i]  // 小红缺少的珠子
        }
    }
    
    // 根据是否缺少珠子输出结果
    if (missing == 0) {
        println("Yes ${extra}")
    } else {
        println("No ${missing}")
    }
}