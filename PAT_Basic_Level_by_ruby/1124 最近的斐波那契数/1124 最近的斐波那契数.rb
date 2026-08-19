# 1124 最近的斐波那契数
#
# 题目描述：
#   本题就请你为任意给定的整数 N 找出与之最近的斐波那契数。
#
# 实现原理：
#   计算斐波那契数列；找出距离给定数最近的斐波那契数；迭代生成数列直到超过目标数
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i

  # 生成斐波那契数列，直到出现不小于 n 的数，确保 n 落在相邻两项之间
  fib = [1, 1]
  fib << fib[-1] + fib[-2] while fib[-1] < n

  # a 为不大于 n 的最大斐波那契数，b 为不小于 n 的最小斐波那契数
  a = fib[-2]
  b = fib[-1]

  # 比较 n 到两侧的“距离”，等距时按题意输出较小者 a
  da = n - a
  db = b - n
  if da < db
    puts a
  elsif db < da
    puts b
  else
    puts a
  end
end
