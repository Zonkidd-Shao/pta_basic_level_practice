# 1077 互评成绩计算
#
# 题目描述：
#   在浙大的计算机专业课中，经常有互评分组报告这个环节。一个组上台介绍自己的工作，其他组在台下为其表现评分。最后这个组的互评成绩是这样计算的：所有其他组的评分中，去掉一个最高分和一个最低分，剩下的分数取平均分记为 G_1；老师给这个组的评分记为 G_2。该组得分为 (G_1+G_2)/2，最后结果四舍五入后保留整数分。本题就要求你写个程序帮助老师计算每个组的互评成绩。
#
# 实现原理：
#   对每个学生的互评分数去掉最高分最低分求平均；与老师评分按比例加权计算最终成绩；输出取整后的成绩
#

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)
  n.times do
    scores = gets.split.map(&:to_i)
    teacher = scores[0]
    peers = scores[1..].select { |score| score.between?(0, m) }.sort
    peers.shift
    peers.pop
    peer_avg = peers.sum.to_f / peers.length
    puts ((teacher + peer_avg) / 2.0).round
  end
end
