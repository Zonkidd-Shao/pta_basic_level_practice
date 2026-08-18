# 1017 A除以B
#
# 题目描述：
#   本题要求计算 A/B，其中 A 是不超过 1000 位的正整数，B 是 1 位正整数。你需要输出商数 Q 和余数 R，使得 A = B \times Q + R 成立。
#
# 实现原理：
#   使用大整数除法，逐位进行计算；模拟手工除法的过程；处理商和余数
#

if __FILE__ == $PROGRAM_NAME
  a, b = gets.split
  b = b.to_i

  quotient = String.new
  remainder = 0
  first = true

  a.each_char do |ch|
    remainder = remainder * 10 + ch.to_i
    q = remainder / b
    unless first && q.zero?
      quotient << q.to_s
      first = false
    end
    remainder = remainder % b
  end

  quotient = '0' if quotient.empty?
  puts "#{quotient} #{remainder}"
end
