// 题目编号：1100  校庆
// 解题思路：
//   给定校友名单和参会人员名单，统计来了多少校友。
//   若校友来了，输出最年长的校友（身份证号7-14位为生日，越小越年长）；
//   若没有校友来，则输出来宾中最年长者。
//   先将校友名单排序，然后用二分查找判断参会者是否为校友。

import std.env.*
import std.convert.*

// 二分查找：在已排序的数组 arr 中查找 key
func binarySearch(arr: Array<String>, key: String): Bool {
    var lo: Int64 = 0
    var hi: Int64 = arr.size - 1
    while (lo <= hi) {
        let mid = lo + (hi - lo) / 2   // 取中间位置，防止溢出
        if (arr[mid] == key) {
            return true                // 找到
        } else if (arr[mid] < key) {
            lo = mid + 1               // 在右半部分继续查找
        } else {
            hi = mid - 1               // 在左半部分继续查找
        }
    }
    return false                       // 未找到
}

main() {
    // 读取校友人数 n 和校友名单
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    var alumni = Array<String>(n, repeat: "")
    for (i in 0..n) {
        alumni[i] = getStdIn().readln().getOrThrow()
    }
    for (i in 0..n) {
        for (j in i + 1..n) {
            if (alumni[i] > alumni[j]) {
                let tmp = alumni[i]
                alumni[i] = alumni[j]
                alumni[j] = tmp
            }
        }
    }

    // 读取参会人数 m 和参会人员名单
    let m = Int64.parse(getStdIn().readln().getOrThrow())
    var cnt: Int64 = 0                 // 统计到场的校友人数
    var oldestAlumniId = ""            // 最年长校友的身份证号
    var oldestAlumniBirth = ""         // 最年长校友的生日
    var oldestGuestId = ""             // 最年长来宾的身份证号
    var oldestGuestBirth = ""          // 最年长来宾的生日

    for (_ in 0..m) {
        let id = getStdIn().readln().getOrThrow()
        let birth = id[6..14]          // 提取身份证号第7-14位（生日 yyyymmdd）
        if (binarySearch(alumni, id)) {
            cnt++                      // 是校友，计数加1
            // 更新最年长校友（生日字符串越小表示越年长）
            if (oldestAlumniId == "" || birth < oldestAlumniBirth) {
                oldestAlumniBirth = birth
                oldestAlumniId = id
            }
        } else {
            // 更新最年长来宾
            if (oldestGuestId == "" || birth < oldestGuestBirth) {
                oldestGuestBirth = birth
                oldestGuestId = id
            }
        }
    }

    println(cnt)                       // 输出来了多少校友
    if (cnt > 0) {
        println(oldestAlumniId)        // 有校友来，输出最年长校友
    } else {
        println(oldestGuestId)         // 无校友来，输出最年长来宾
    }
}

