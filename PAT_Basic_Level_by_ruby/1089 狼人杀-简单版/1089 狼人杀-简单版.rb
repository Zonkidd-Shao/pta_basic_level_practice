# 1089 狼人杀-简单版
#
# 题目描述：
#   以下文字摘自《灵机一动·好玩的数学》：“狼人杀”游戏分为狼人、好人两大阵营。在一局“狼人杀”游戏中，1 号玩家说：“2 号是狼人”，2 号玩家说：“3 号是好人”，3 号玩家说：“4 号是狼人”，4 号玩家说：“5 号是好人”，5 号玩家说：“4 号是好人”。已知这 5 名玩家中有 2 人扮演狼人角色，有 2 人说的不是实话，有狼人撒谎但并不是所有狼人都在撒谎。扮演狼人角色的是哪两号玩家？
#   本题是这个问题的升级版：已知 N 名玩家中有 2 人扮演狼人角色，有 2 人说的不是实话，有狼人撒谎但并不是所有狼人都在撒谎。要求你找出扮演狼人角色的是哪几号玩家？
#
# 实现原理：
#   枚举所有可能的狼人组合；验证是否满足题目条件；使用逻辑推理找出正确答案
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  says = [nil] + gets.split.map(&:to_i) # 1-based

  found = nil
  (1..n).each do |i|
    (i + 1..n).each do |j|
      wolves = [i, j].to_set
      liars = []
      (1..n).each do |k|
        claimed_wolf = says[k].negative?
        accused = says[k].abs
        actual_wolf = wolves.include?(accused)
        liars << k if claimed_wolf != actual_wolf
      end
      if liars.length == 2 && (wolves.include?(liars[0]) != wolves.include?(liars[1]))
        found = [i, j]
        break
      end
    end
    break if found
  end

  if found
    puts "#{found[0]} #{found[1]}"
  else
    puts 'No Solution'
  end
end
