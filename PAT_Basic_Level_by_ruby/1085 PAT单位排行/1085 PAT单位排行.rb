# 1085 PAT单位排行
#
# 题目描述：
#   每次 PAT 考试结束后，考试中心都会发布一个考生单位排行榜。本题就请你实现这个功能。
#
# 实现原理：
#   按学校统计考生的加权总分；不同级别考试有不同权重；按总分排序输出学校排名
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  schools = Hash.new { |h, k| h[k] = { total: 0.0, count: 0 } }

  n.times do
    id, score, sch = gets.split
    score = score.to_i
    sch = sch.downcase
    weight = case id[0]
             when 'B' then score * 2.0 / 3
             when 'T' then score * 1.5
             else score.to_f
             end
    schools[sch][:total] += weight
    schools[sch][:count] += 1
  end

  list = schools.map do |sch, info|
    { sch: sch, total: info[:total].floor, count: info[:count] }
  end
  list.sort_by! { |s| [-s[:total], s[:count], s[:sch]] }

  puts list.length
  rank = 0
  list.each_with_index do |s, i|
    rank = i + 1 if i.zero? || s[:total] != list[i - 1][:total]
    puts "#{rank} #{s[:sch]} #{s[:total]} #{s[:count]}"
  end
end
