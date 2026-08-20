# 1113 钱串子的加法
#
# 题目描述：
#   ![qcz.JPG](~/3f9ac9be-c2a5-444f-a83c-e45f76303613.JPG)
#   人类习惯用 10 进制，可能因为大多数人类有 10 根手指头，可以用于计数。这个世界上有一种叫“钱串子”（学名“蚰蜒”）的生物，有 30 只细长的手/脚，在它们的世界里，数字应该是 30 进制的。本题就请你实现钱串子世界里的加法运算。
#
# 实现原理：
#   实现特殊货币格式的加法；处理不同单位的进位关系；格式化输出结果
#

if __FILE__ == $PROGRAM_NAME
  alphabet = '0123456789abcdefghijklmnopqrst'
  a, b = gets.split
  result = []
  carry = 0
  max_length = [a.length, b.length].max
  max_length.times do |i|
    left = i < a.length ? alphabet.index(a[-1 - i]) : 0
    right = i < b.length ? alphabet.index(b[-1 - i]) : 0
    total = left + right + carry
    result << alphabet[total % 30]
    carry = total / 30
  end
  result << alphabet[carry] if carry.positive?
  answer = result.reverse.join.sub(/\A0+/, '')
  puts(answer.empty? ? '0' : answer)
end
