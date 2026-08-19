# 1023 组个最小数
#
# 题目描述：
#   给定数字 0-9 各若干个。你可以以任意顺序排列这些数字，但必须全部使用。目标是使得最后得到的数尽可能小（注意 0 不能做首位）。例如：给定两个 0，两个 1，三个 5，一个 8，我们得到的最小的数就是 10015558。
#   现给定数字，请编写程序输出能够组成的最小的数。
#
# 实现原理：
#   使用贪心策略构造最小数；首位取最小的非零数字；剩余位按从小到大依次排列
#

if __FILE__ == $PROGRAM_NAME
  counts = gets.split.map(&:to_i) # counts[i] 表示数字 i 的个数

  first = nil
  (1..9).each do |d|
    if counts[d] > 0
      first = d
      counts[d] -= 1
      break
    end
  end

  parts = []
  parts << first.to_s if first
  (0..9).each do |d|
    parts << d.to_s * counts[d]
  end
  puts parts.join
end
