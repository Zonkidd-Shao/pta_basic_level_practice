# 1082 射击比赛
#
# 题目描述：
#   本题目给出的射击比赛的规则非常简单，谁打的弹洞距离靶心最近，谁就是冠军；谁差得最远，谁就是菜鸟。本题给出一系列弹洞的平面坐标(x,y)，请你编写程序找出冠军和菜鸟。我们假设靶心在原点(0,0)。
#
# 实现原理：
#   计算每个射手的成绩（距离靶心的距离）；按成绩排序找出冠军和垫底；使用数学计算距离
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  nearest = farthest = nil
  min_d = Float::INFINITY
  max_d = -1

  n.times do
    id, x, y = gets.split
    d = x.to_i**2 + y.to_i**2
    if d < min_d
      min_d = d
      nearest = id
    end
    if d > max_d
      max_d = d
      farthest = id
    end
  end

  puts "#{nearest} #{farthest}"
end
