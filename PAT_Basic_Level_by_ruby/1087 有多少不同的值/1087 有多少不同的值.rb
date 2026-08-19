# 1087 有多少不同的值
#
# 题目描述：
#   当自然数 n 依次取 1、2、3、……、N 时，算式 \lfloor n/2\rfloor +\lfloor n/3\rfloor +\lfloor n/5\rfloor  有多少个不同的值？（注：\lfloor x\rfloor 为取整函数，表示不超过 x 的最大自然数，即 x 的整数部分。）
#
# 实现原理：
#   计算n经过整数除法得到的所有不同值；n除以1到n的所有整数得到不同结果；使用集合去重统计数量
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  values = Set.new
  (1..n).each { |i| values << i + i.digits.sum }
  puts values.length
end
