// PAT Basic Level 1015 德才论
// 解题思路：输入考生的准考证号、德分和才分，根据德才分数进行分档排序。
// 排序规则：类别从小到大（1类>2类>3类>4类），总分从大到小，德分从大到小，准考证号从小到大。
// 使用归并排序实现稳定高效的排序。
import std.env.*
import std.convert.*

// 归并排序的合并操作，按照题目要求的排序规则进行比较
func merge(arr: ArrayList<Int64>, left: Int64, mid: Int64, right: Int64,
           ids: ArrayList<Int64>, des: ArrayList<Int64>, totals: ArrayList<Int64>, cls: ArrayList<Int64>) {
    let n1 = mid - left + 1
    let n2 = right - mid
    var L = ArrayList<Int64>()
    var R = ArrayList<Int64>()
    for (i in 0..n1) {
        L.append(arr[left + i])
    }
    for (i in 0..n2) {
        R.append(arr[mid + 1 + i])
    }
    var i: Int64 = 0
    var j: Int64 = 0
    var k = left
    while (i < n1 && j < n2) {
        let idxL = L[i]
        let idxR = R[j]
        // 排序规则：类别从小到大 > 总分从大到小 > 德分从大到小 > 准考证号从小到大
        var cmp = false
        if (cls[idxL] != cls[idxR]) {
            cmp = cls[idxL] < cls[idxR]          // 类别小的在前
        } else if (totals[idxL] != totals[idxR]) {
            cmp = totals[idxL] > totals[idxR]    // 总分大的在前
        } else if (des[idxL] != des[idxR]) {
            cmp = des[idxL] > des[idxR]          // 德分大的在前
        } else {
            cmp = ids[idxL] < ids[idxR]          // 准考证号小的在前
        }
        if (cmp) {
            arr[k] = idxL
            i = i + 1
        } else {
            arr[k] = idxR
            j = j + 1
        }
        k = k + 1
    }
    while (i < n1) {
        arr[k] = L[i]
        i = i + 1
        k = k + 1
    }
    while (j < n2) {
        arr[k] = R[j]
        j = j + 1
        k = k + 1
    }
}

// 归并排序的递归分治部分
func mergeSort(arr: ArrayList<Int64>, left: Int64, right: Int64,
               ids: ArrayList<Int64>, des: ArrayList<Int64>, totals: ArrayList<Int64>, cls: ArrayList<Int64>) {
    if (left < right) {
        let mid = (left + right) / 2
        mergeSort(arr, left, mid, ids, des, totals, cls)
        mergeSort(arr, mid + 1, right, ids, des, totals, cls)
        merge(arr, left, mid, right, ids, des, totals, cls)
    }
}

main(): Int64 {
    // 读取 N（考生总数）、L（最低录取线）、H（优先录取线）
    let line1 = getStdIn().readln().getOrThrow()
    let parts1 = line1.split(" ")
    let n = Int64.parse(parts1[0])
    let l = Int64.parse(parts1[1])
    let h = Int64.parse(parts1[2])
    var ids = ArrayList<Int64>()       // 准考证号
    var des = ArrayList<Int64>()       // 德分
    var cais = ArrayList<Int64>()      // 才分
    var totals = ArrayList<Int64>()    // 总分（德分+才分）
    var cls = ArrayList<Int64>()       // 类别（1类最优，4类最差）
    // 读取每位考生的信息，筛选德才均不低于 L 的考生
    for (_ in 1..=n) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let id = Int64.parse(parts[0])
        let de = Int64.parse(parts[1])
        let cai = Int64.parse(parts[2])
        if (de >= l && cai >= l) {
            ids.append(id)
            des.append(de)
            cais.append(cai)
            totals.append(de + cai)
            // 分档：1类（德才均>=h），2类（德>=h但才<h），3类（德才<h但德>=才），4类（其他）
            if (de >= h && cai >= h) {
                cls.append(1)
            } else if (de >= h && cai < h) {
                cls.append(2)
            } else if (de < h && cai < h && de >= cai) {
                cls.append(3)
            } else {
                cls.append(4)
            }
        }
    }
    let m = ids.size
    // 创建索引数组，对索引进行排序以避免移动大量数据
    var indices = ArrayList<Int64>()
    for (i in 0..m) {
        indices.append(i)
    }
    if (m > 1) {
        mergeSort(indices, 0, m - 1, ids, des, totals, cls)
    }
    // 输出合格考生人数和排序后的名单
    println(m)
    for (idx in indices) {
        println("${ids[idx]} ${des[idx]} ${cais[idx]}")
    }
    return 0
}

