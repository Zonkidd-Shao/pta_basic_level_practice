# 1034 有理数四则运算
#
# 题目描述：
#   本题要求编写程序，计算 2 个有理数的和、差、积、商。
#
# 实现原理：
#   使用分数形式存储有理数（分子/分母）；实现分数的加减乘除运算；结果要约分并处理整数、假分数、负数格式
#

# 最大公约数
# @param a [Integer]
# @param b [Integer]
# @return [Integer]
def gcd(a, b)
  a = a.abs
  b = b.abs
  a, b = b, a % b while b != 0
  a
end

# 将分数化为最简并格式化为字符串
# @param num [Integer]
# @param den [Integer]
# @return [String]
def format_rational(num, den)
  return '0' if num.zero?

  den = -den if den < 0
  num = -num if den < 0
  g = gcd(num, den)
  num /= g
  den /= g

  neg = num < 0
  num = num.abs
  sign = neg ? '-' : ''

  if den == 1
    "#{sign}#{num}"
  elsif num > den
    "#{sign}#{num / den} #{num % den}/#{den}"
  else
    "#{sign}#{num}/#{den}"
  end
end

if __FILE__ == $PROGRAM_NAME
  r1, r2 = gets.split
  a, b = r1.split('/').map(&:to_i)
  c, d = r2.split('/').map(&:to_i)

  # 输入分母规范化（符号归到分子）
  b = -b if b < 0
  a = -a if b < 0
  d = -d if d < 0
  c = -c if d < 0

  add = [a * d + c * b, b * d]
  sub = [a * d - c * b, b * d]
  mul = [a * c, b * d]
  div = c.zero? ? nil : [a * d, b * c]

  s1 = format_rational(a, b)
  s2 = format_rational(c, d)
  s_add = format_rational(*add)
  s_sub = format_rational(*sub)
  s_mul = format_rational(*mul)
  s_div = div.nil? ? 'Inf' : format_rational(*div)

  puts "#{s1} + #{s2} = #{s_add}"
  puts "#{s1} - #{s2} = #{s_sub}"
  puts "#{s1} * #{s2} = #{s_mul}"
  puts "#{s1} / #{s2} = #{s_div}"
end
