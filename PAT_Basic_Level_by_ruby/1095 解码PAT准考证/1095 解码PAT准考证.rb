# 1095 解码PAT准考证
#
# 题目描述：
#   PAT 准考证号由 4 部分组成：
#   - 第 1 位是级别，即 `T` 代表顶级；`A` 代表甲级；`B` 代表乙级；
#   - 第 2~4 位是考场编号，范围从 101 到 999；
#   - 第 5~10 位是考试日期，格式为年、月、日顺次各占 2 位；
#   - 最后 11~13 位是考生编号，范围从 000 到 999。
#   现给定一系列考生的准考证号和他们的成绩，请你按照要求输出各种统计信息。
#
# 实现原理：
#   解析准考证号的各部分含义；根据不同类型的查询进行统计和排序；使用多种数据结构高效处理查询
#

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)
  students = []
  n.times do
    ticket, score = gets.split
    students << { ticket: ticket, score: score.to_i, level: ticket[0], loc: ticket[1..3], date: ticket[4..9] }
  end

  m.times do
    type, term = gets.split
    if type == '1'
      matched = students.select { |s| s[:level] == term }.sort_by { |s| [-s[:score], s[:ticket]] }
      if matched.empty?
        puts 'NA'
      else
        matched.each { |s| puts "#{s[:ticket]} #{s[:score]}" }
      end
    elsif type == '2'
      matched = students.select { |s| s[:loc] == term }
      if matched.empty?
        puts 'NA'
      else
        total = matched.sum { |s| s[:score] }
        puts "#{matched.length} #{total}"
      end
    else
      h = Hash.new(0)
      students.each { |s| h[s[:loc]] += 1 if s[:date] == term }
      if h.empty?
        puts 'NA'
      else
        h.sort_by { |loc, cnt| [-cnt, loc] }.each { |loc, cnt| puts "#{loc} #{cnt}" }
      end
    end
  end
end
