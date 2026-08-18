# 1064 朋友数
#
# 题目描述：
#   如果两个整数各位数字的和是一样的，则被称为是“朋友数”，而那个公共的和就是它们的“朋友证号”。例如 123 和 51 就是朋友数，因为 1+2+3 = 5+1 = 6，而 6 就是它们的朋友证号。给定一些整数，要求你统计一下它们中有多少个不同的朋友证号。
#
# 实现原理：
#   计算每个数字的各位和（朋友证号）；使用集合去重存储所有朋友证号；统计不同朋友证号的数量并输出
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  nums = gets.split.map(&:to_i)

  friend_ids = Set.new
  nums.each { |x| friend_ids << x.digits.sum }

  sorted = friend_ids.to_a.sort
  puts sorted.length
  puts sorted.join(' ')
end
