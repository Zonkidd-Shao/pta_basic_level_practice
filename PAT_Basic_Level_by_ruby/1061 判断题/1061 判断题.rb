# 1061 判断题
#
# 题目描述：
#   判断题的评判很简单，本题就要求你写个简单的程序帮助老师判题并统计学生们判断题的得分。
#
# 实现原理：
#   对比学生答案与正确答案；统计每个学生的得分；简单的数组遍历和计数
#

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)
  scores = gets.split.map(&:to_i)
  answers = gets(chomp: true).gsub(/\s/, '').chars

  n.times do
    stu = gets(chomp: true).gsub(/\s/, '').chars
    total = 0
    m.times do |i|
      total += scores[i] if stu[i] == answers[i]
    end
    puts total
  end
end
