# 1062 最简分数
#
# 题目描述：
#   一个分数一般写成两个整数相除的形式：N/M，其中 M 不为0。最简分数是指分子和分母没有公约数的分数表示形式。
#   现给定两个不相等的正分数 N_1/M_1 和 N_2/M_2，要求你按从小到大的顺序列出它们之间分母为 K 的最简分数。
#
# 实现原理：
#   在给定范围内找出所有最简分数；使用最大公约数判断是否为最简分数；按从小到大顺序输出
#

# 最大公约数
# @param a [Integer]
# @param b [Integer]
# @return [Integer]
def gcd(a, b)
  a, b = b, a % b while b != 0
  a
end

if __FILE__ == $PROGRAM_NAME
  a, b, c, d, l = gets.split.map(&:to_i)

  result = []
  (1...l).each do |k|
    next unless gcd(k, l) == 1
    # a/b < k/L < c/d，使用交叉相乘避免浮点误差
    next unless a * l < k * b && k * d < c * l

    result << k
  end

  puts result.map { |k| "#{k}/#{l}" }.join(' ')
end
