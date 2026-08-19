import std.env.*
import std.convert.*
import std.sort.*

// PAT Basic Level 1055 集体照
// 解题思路：先按身高降序排序（身高相同按名字字典序升序）
// 最后一排（输出第一行）人数为 N%K + N/K 个，其余每排 N/K 个
// 每排排布规则：最高的人站中间，然后依次交替插入左右两侧
// （从摄影师视角看是"先左后右"交替插入）
class Person {
    var name: String
    var height: Int64
    
    init(name: String, height: Int64) {
        this.name = name
        this.height = height
    }
}

main() {
    // 读取总人数 N 和排数 K
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let n = Int64.parse(parts[0])
    let k = Int64.parse(parts[1])
    
    // 读取所有人的姓名和身高
    var persons = Array<Person>(n, item: Person("", 0))
    for (i in 0..n) {
        let info = getStdIn().readln().getOrThrow()
        let infoParts = info.split(" ")
        persons[i] = Person(infoParts[0], Int64.parse(infoParts[1]))
    }
    
    // 按身高降序排序，身高相同则按姓名字典序升序
    persons.sort((a, b) => {
        if (a.height != b.height) {
            return b.height - a.height
        }
        if (a.name < b.name) { return -1 }
        if (a.name > b.name) { return 1 }
        return 0
    })
    
    let base = n / k       // 每排基础人数（最后一排除外）
    let lastExtra = n % k  // 最后一排的额外人数
    
    var idx: Int64 = 0               // 当前处理到第几个人
    var allRows = ArrayList<Array<String>>()
    
    for (row in 0..k) {
        var m: Int64
        if (row == 0) {
            m = base + lastExtra  // 最后一排（最先输出，人数最多）
        } else {
            m = base
        }
        
        var names = Array<String>(m, item: "")
        let mid = m / 2  // 中间位置（0-based），最高的人站这里
        
        // 先让最高的人站中间位置
        names[mid] = persons[idx].name
        idx++
        
        // 然后按"先左后右"交替向两侧插入
        // 从摄影师视角看是"先左后右"，即先填中间左边、再填中间右边、交替进行
        var left = mid - 1
        var right = mid + 1
        
        while (left >= 0 || right < m) {
            if (left >= 0) {
                names[left] = persons[idx].name
                idx++
                left--
            }
            if (right < m) {
                names[right] = persons[idx].name
                idx++
                right++
            }
        }
        
        allRows.append(names)
    }
    
    // 按顺序输出各排（最后一排先输出，即 row=0 先输出）
    for (ri in 0..allRows.size) {
        let names = allRows[ri]
        var sb = ""
        for (j in 0..names.size) {
            if (j > 0) { sb += " " }
            sb += names[j]
        }
        println(sb)
    }
}

