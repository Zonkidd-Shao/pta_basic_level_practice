# 1032 挖掘机技术哪家强
#
# 题目描述：
#   为了用事实说明挖掘机技术到底哪家强，PAT 组织了一场挖掘机技能大赛。现请你根据比赛结果统计出技术最强的那个学校。
#
# 实现原理：
#   使用数组或哈希表记录各学校总分；累加每个选手的分数到对应学校；找出总分最高的学校
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  scores = Hash.new(0)

  n.times do
    school, score = gets.split.map(&:to_i)
    scores[school] += score
  end

  best_school, best_score = scores.max_by { |_, v| v }
  puts "#{best_school} #{best_score}"
end
