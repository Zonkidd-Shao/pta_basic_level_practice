import std.env.*
import std.convert.*

// PAT_Basic_Level 1035 插入与归并
// 解题思路：判断中间序列是由插入排序还是归并排序产生。
// 插入排序的特点是：前部分有序，后部分与原始序列相同。
// 归并排序则模拟归并过程，逐步增大步长，直到与中间序列匹配，
// 再执行下一轮归并后输出结果。
main(): Int64 {
    // 读取 N、原始序列和中间序列
    let N = Int64.parse(getStdIn().readln().getOrThrow())

    let origLine = getStdIn().readln().getOrThrow()
    let origParts = origLine.split(" ")
    let midLine = getStdIn().readln().getOrThrow()
    let midParts = midLine.split(" ")

    var orig = Array<Int64>(N)
    var mid = Array<Int64>(N)
    for (i in 0..N) {
        orig[i] = Int64.parse(origParts[i])
        mid[i] = Int64.parse(midParts[i])
    }

    // 判断是否为插入排序：找到中间序列中第一个破坏升序的位置
    var sortedEnd: Int64 = 0
    for (i in 1..N) {
        if (mid[i] >= mid[i-1]) {
            sortedEnd = i  // 记录有序部分的末尾
        } else {
            break  // 第一个降序位置
        }
    }

    // 检查有序部分之后的元素是否与原始序列对应位置一致
    var isInsertion = true
    for (i in sortedEnd + 1..N) {
        if (mid[i] != orig[i]) {
            isInsertion = false
            break
        }
    }

    if (isInsertion) {
        // 插入排序：再进行一轮插入操作
        println("Insertion Sort")
        if (sortedEnd + 1 < N) {
            let key = mid[sortedEnd + 1]  // 待插入的元素
            var j = sortedEnd
            // 将大于 key 的元素后移
            while (j >= 0 && mid[j] > key) {
                mid[j + 1] = mid[j]
                j--
            }
            mid[j + 1] = key  // 插入 key 到正确位置
        }
        // 输出下一轮结果
        for (i in 0..N) {
            if (i > 0) {
                Console.stdOut.write(" ")
            }
            Console.stdOut.write(mid[i].toString())
        }
        println("")
    } else {
        // 归并排序：模拟归并过程
        println("Merge Sort")
        var arr = Array<Int64>(N)
        for (i in 0..N) {
            arr[i] = orig[i]  // 从原始序列开始模拟
        }

        var step: Int64 = 1
        while (true) {
            step = step * 2
            // 执行一轮归并：将相邻的 step/2 大小的子序列两两归并为 step 大小
            var i: Int64 = 0
            while (i < N) {
                let left = i
                let midIdx = min(i + step / 2, N)
                let right = min(i + step, N)
                merge(arr, left, midIdx, right)
                i = i + step
            }

            // 检查当前状态是否与中间序列匹配
            var match = true
            for (j in 0..N) {
                if (arr[j] != mid[j]) {
                    match = false
                    break
                }
            }

            if (match) {
                // 匹配成功，再执行一轮归并后输出
                step = step * 2
                var j: Int64 = 0
                while (j < N) {
                    let left = j
                    let midIdx = min(j + step / 2, N)
                    let right = min(j + step, N)
                    merge(arr, left, midIdx, right)
                    j = j + step
                }
                // 输出下一轮结果
                for (k in 0..N) {
                    if (k > 0) {
                        Console.stdOut.write(" ")
                    }
                    Console.stdOut.write(arr[k].toString())
                }
                println("")
                break
            }
        }
    }
    return 0
}

// 归并两个有序子数组 arr[left..midIdx-1] 和 arr[midIdx..right-1]
func merge(arr: Array<Int64>, left: Int64, midIdx: Int64, right: Int64) {
    if (left >= midIdx || midIdx >= right) {
        return
    }
    var temp = Array<Int64>(right - left)  // 临时数组存放归并结果
    var i = left
    var j = midIdx
    var p: Int64 = 0
    // 比较两个子数组的元素，按升序归并到 temp
    while (i < midIdx && j < right) {
        if (arr[i] <= arr[j]) {
            temp[p] = arr[i]
            i++
        } else {
            temp[p] = arr[j]
            j++
        }
        p++
    }
    // 将左子数组剩余元素复制到 temp
    while (i < midIdx) {
        temp[p] = arr[i]
        i++
        p++
    }
    // 将右子数组剩余元素复制到 temp
    while (j < right) {
        temp[p] = arr[j]
        j++
        p++
    }
    // 将 temp 写回原数组
    for (k in 0..temp.size) {
        arr[left + k] = temp[k]
    }
}

// 求两个数的最小值
func min(a: Int64, b: Int64): Int64 {
    if (a < b) {
        return a
    }
    return b
}

