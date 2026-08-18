# 1088 三人行
#
# 题目描述：
#   子曰：“三人行，必有我师焉。择其善者而从之，其不善者而改之。”
#   本题给定甲、乙、丙三个人的能力值关系为：甲的能力值确定是 2 位正整数；把甲的能力值的 2 个数字调换位置就是乙的能力值；甲乙两人能力差是丙的能力值的 X 倍；乙的能力值是丙的 Y 倍。请你指出谁比你强应“从之”，谁比你弱应“改之”。
#
# 实现原理：
#   根据已知条件推导三个人的能力值；比较三个人的能力大小关系；使用代数方法求解方程
#

if __FILE__ == $PROGRAM_NAME
  a, x, y = gets.split.map(&:to_i)
  jia = a
  yi = a * x
  bing = a * y

  puts "#{jia} #{yi} #{bing}"

  trio = [['jia', jia], ['yi', yi], ['bing', bing]]
  max_val = trio.map { |_, v| v }.max
  master = trio.find { |_, v| v == max_val }.first
  puts "#{master} is the master"
end
