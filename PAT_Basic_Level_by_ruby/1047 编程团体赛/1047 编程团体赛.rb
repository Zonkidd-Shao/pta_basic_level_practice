# 1047 编程团体赛
#
# 题目描述：
#   编程团体赛的规则为：每个参赛队由若干队员组成；所有队员独立比赛；参赛队的成绩为所有队员的成绩和；成绩最高的队获胜。
#   现给定所有队员的比赛成绩，请你编写程序找出冠军队。
#
# 实现原理：
#   按团队编号累加各队员得分；找出总分最高的团队；使用数组或哈希表存储团队总分
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  scores = Hash.new(0)

  n.times do
    team, _member, score = gets.split
    scores[team.to_i] += score.to_i
  end

  best = scores.max_by { |_, v| v }
  puts "#{best[0]} #{best[1]}"
end
