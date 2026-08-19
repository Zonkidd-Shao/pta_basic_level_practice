# 1080 MOOC期终成绩
#
# 题目描述：
#   对于在中国大学MOOC（http://www.icourse163.org/ ）学习“数据结构”课程的学生，想要获得一张合格证书，必须首先获得不少于200分的在线编程作业分，然后总评获得不少于60分（满分100）。总评成绩的计算公式为 G = (G_{mid-term}\times 40\% + G_{final}\times 60\%)，如果 G_{mid-term} > G_{final}；否则总评 G 就是 G_{final}。这里 G_{mid-term} 和 G_{final} 分别为学生的期中和期末成绩。
#   现在的问题是，每次考试都产生一张独立的成绩单。本题就请你编写程序，把不同的成绩单合为一张。
#
# 实现原理：
#   整合学生的期中和期末成绩；按规则计算最终成绩（期末占比大）；按最终成绩排序输出合格学生
#

if __FILE__ == $PROGRAM_NAME
  p, m, n = gets.split.map(&:to_i)
  students = {}

  p.times do
    name, score = gets.split
    students[name] ||= {}
    students[name][:gp] = score.to_i
  end
  m.times do
    name, score = gets.split
    students[name] ||= {}
    students[name][:gmid] = score.to_i
  end
  n.times do
    name, score = gets.split
    students[name] ||= {}
    students[name][:gfinal] = score.to_i
  end

  result = []
  students.each do |name, s|
    gp = s[:gp]
    gfinal = s[:gfinal]
    next if gp.nil? || gp < 200 || gfinal.nil?

    gmid = s[:gmid] || 0
    g = if gfinal >= gmid
          gfinal
        else
          (gmid * 0.4 + gfinal * 0.6).round
        end
    next if g < 60

    result << { name: name, gp: gp, gmid: gmid, gfinal: gfinal, g: g }
  end

  result.sort_by! { |s| [-s[:g], s[:name]] }
  result.each do |s|
    puts "#{s[:name]} #{s[:gp]} #{s[:gmid]} #{s[:gfinal]} #{s[:g]}"
  end
end
