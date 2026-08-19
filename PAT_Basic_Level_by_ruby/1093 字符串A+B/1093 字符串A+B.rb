# 1093 字符串A+B
#
# 题目描述：
#   给定两个字符串 A 和 B，本题要求你输出 A+B，即两个字符串的并集。要求先输出 A，再输出 B，但**重复的字符必须被剔除**。
#
# 实现原理：
#   拼接两个字符串并去除重复字符；保持字符第一次出现的顺序；使用集合记录已出现的字符
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  a = gets(chomp: true)
  b = gets(chomp: true)
  seen = Set.new
  result = String.new
  (a + b).each_char do |c|
    next if seen.include?(c)

    seen.add(c)
    result << c
  end
  puts result
end
