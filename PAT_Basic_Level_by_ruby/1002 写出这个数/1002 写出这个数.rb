# 1002 写出这个数
#
# 题目描述：
#   读入一个正整数 n，计算其各位数字之和，用汉语拼音写出和的每一位数字。
#
# 实现原理：
#   逐字符读取大整数避免溢出问题；累加各位数字求和；将和的每一位数字转换为拼音输出
#

PINYIN = %w[ling yi er san si wu liu qi ba jiu].freeze

if __FILE__ == $PROGRAM_NAME
  n = gets(chomp: true)
  # n 可能非常大，逐字符求和避免整数溢出问题（虽然 Ruby 整数无上限，这里按字符处理更直观）
  sum = n.each_char.sum(0) { |ch| ch.to_i }
  digits = sum.digits.reverse
  puts digits.map { |d| PINYIN[d] }.join(' ')
end
