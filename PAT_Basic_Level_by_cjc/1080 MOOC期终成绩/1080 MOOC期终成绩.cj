import std.env.*
import std.convert.*

// 1080 MOOC期终成绩
// 思路：分别读取编程、期中、期末三块成绩，用哈希表按学号存储。
// 总评规则：编程分>=200且总评>=60分才合格；
// 期中>期末时总评=期中*0.4+期末*0.6，否则总评=期末。
// 按总评降序、学号升序排序后输出。

// 学生信息结构体
class Student {
    var id: String
    var gp: Int64      // 在线编程成绩
    var gmid: Int64    // 期中考试成绩，缺失为-1
    var gfinal: Int64   // 期末考试成绩，缺失为-1
    var g: Int64        // 总评成绩

    init(id: String) {
        this.id = id
        this.gp = -1
        this.gmid = -1
        this.gfinal = -1
        this.g = -1
    }

    // 计算总评成绩
    func calc() {
        // 编程成绩必须>=200才可能合格
        if (this.gp < 200) {
            this.g = -1
            return
        }
        var finalScore: Float64
        // 期中成绩高于期末时，按比例计算总评
        if (this.gmid > this.gfinal) {
            finalScore = Float64(this.gmid) * 0.4 + Float64(this.gfinal) * 0.6
        } else {
            // 否则总评直接等于期末成绩
            finalScore = Float64(this.gfinal)
        }
        // 四舍五入取整
        this.g = Int64(finalScore + 0.5)
        // 总评低于60分视为不合格
        if (this.g < 60) {
            this.g = -1
        }
    }
}

main() {
    // 读取P、M、N（编程人数、期中人数、期末人数）
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var P = Int64.parse(parts[0])
    var M = Int64.parse(parts[1])
    var N = Int64.parse(parts[2])

    // 用哈希表存储所有学生，学号作为键
    var students = HashMap<String, Student>()

    // 读取P个在线编程成绩
    for (_ in 0..P) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        var id = parts[0]
        var score = Int64.parse(parts[1])
        if (!students.contains(id)) {
            students[id] = Student(id)
        }
        students[id].gp = score
    }

    // 读取M个期中考试成绩
    for (_ in 0..M) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        var id = parts[0]
        var score = Int64.parse(parts[1])
        if (!students.contains(id)) {
            students[id] = Student(id)
        }
        students[id].gmid = score
    }

    // 读取N个期末考试成绩
    for (_ in 0..N) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        var id = parts[0]
        var score = Int64.parse(parts[1])
        if (!students.contains(id)) {
            students[id] = Student(id)
        }
        students[id].gfinal = score
    }

    // 计算所有学生的总评，筛选出合格的学生
    var qualified = ArrayList<Student>()
    for (s in students.values()) {
        s.calc()
        if (s.g >= 60) {
            qualified.append(s)
        }
    }

    // 排序：按总评降序，学号升序
    qualified.sort(func(a: Student, b: Student): Int64 {
        if (a.g != b.g) {
            return b.g - a.g
        }
        return a.id.compareTo(b.id)
    })

    // 输出合格学生信息
    for (s in qualified) {
        var gmidStr = if (s.gmid == -1) "-1" else s.gmid.toString()
        var gfinalStr = if (s.gfinal == -1) "-1" else s.gfinal.toString()
        println("${s.id} ${s.gp} ${gmidStr} ${gfinalStr} ${s.g}")
    }
}