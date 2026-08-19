import std.env.*
import std.convert.*

// PAT_Basic_Level 1030 完美数列
// 解题思路：先对数列升序排序，然后用双指针（滑动窗口）法寻找满足
// M <= m * p 的最长子序列。固定右指针 right，移动左指针 left 使条件成立，
// 记录过程中窗口的最大长度。
main(): Int64 {
    // 读取 N 和 p
    let line1 = getStdIn().readln().getOrThrow()
    let parts1 = line1.split(" ")
    let N = Int64.parse(parts1[0])
    let p = Int64.parse(parts1[1])

    // 读取数列并存入数组
    let line2 = getStdIn().readln().getOrThrow()
    let parts2 = line2.split(" ")
    var arr = Array<Int64>(N)
    for (i in 0..N) {
        arr[i] = Int64.parse(parts2[i])
    }

    // 对数组进行快速排序（升序），使最小值在左、最大值在右
    quickSort(arr, 0, N - 1)

    var maxLen: Int64 = 0   // 记录最长完美数列的长度
    var left: Int64 = 0     // 左指针，表示当前窗口的最小值位置
    // 右指针 right 遍历数组，作为当前窗口的最大值
    for (right in 0..N) {
        // 当 M > m * p 时，不满足完美数列条件，左指针右移缩小窗口
        while (arr[right] > arr[left] * p) {
            left++
        }
        // 计算当前窗口长度并更新最大值
        let curLen = right - left + 1
        if (curLen > maxLen) {
            maxLen = curLen
        }
    }

    println(maxLen.toString())
    return 0
}

// 快速排序递归函数
func quickSort(arr: Array<Int64>, low: Int64, high: Int64) {
    if (low < high) {
        let pi = partition(arr, low, high)
        quickSort(arr, low, pi - 1)
        quickSort(arr, pi + 1, high)
    }
}

// 快速排序分区函数，选取最后一个元素作为枢轴
func partition(arr: Array<Int64>, low: Int64, high: Int64): Int64 {
    let pivot = arr[high]  // 枢轴元素
    var i = low - 1        // 小于枢轴的元素区的右边界
    for (j in low..high) {
        if (arr[j] < pivot) {
            i++
            // 将小于枢轴的元素交换到左侧
            let tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
        }
    }
    // 将枢轴放到正确位置
    let tmp = arr[i + 1]
    arr[i + 1] = arr[high]
    arr[high] = tmp
    return i + 1  // 返回枢轴位置
}

