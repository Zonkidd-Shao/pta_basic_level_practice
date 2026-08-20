# 1103 缘分数
#
# 题目描述：
#   所谓**缘分数**是指这样一对正整数 a 和 b，其中 a 和它的小弟 a-1 的立方差正好是另一个整数 c 的平方，而 c 正好是 b 和它的小弟 b-1 的平方和。例如 8^3 - 7^3 = 169 = 13^2，而 13 = 3^2 + 2^2，于是 8 和 3 就是一对缘分数。
#   给定 a 所在的区间 [m,n]，是否存在缘分数？
#
# 实现原理：
#   找出两个数的真约数之和；判断是否满足：甲的约数和等于乙，乙的约数和等于甲；计算真约数并验证条件
#

if __FILE__ == $PROGRAM_NAME
  l, r = gets.split.map(&:to_i)
  result = []

  (l..r).each do |a|
    square = a**3 - (a - 1)**3
    c = Math.sqrt(square).to_i
    next unless c * c == square

    (1..Math.sqrt(c).to_i).each do |b|
      result << [a, b] if b * b + (b - 1) * (b - 1) == c
    end
  end

  if result.empty?
    puts 'No Solution'
  else
    result.each { |a, b| puts "#{a} #{b}" }
  end
end
