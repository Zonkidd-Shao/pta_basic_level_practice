# 1033 旧键盘打字
#
# 题目描述：
#   旧键盘上坏了几个键，于是在敲一段文字的时候，对应的字符就不会出现。现在给出应该输入的一段文字、以及坏掉的那些键，打出的结果文字会是怎样？
#
# 实现原理：
#   对比期望输出和实际输出的差异；找出缺失的按键；使用集合记录已输出的坏键避免重复
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  broken = gets(chomp: true).upcase
  broken_set = broken.chars.to_set
  text = gets(chomp: true)

  result = text.chars.reject do |ch|
    if ch =~ /[a-zA-Z]/
      broken_set.include?(ch.upcase)
    else
      broken_set.include?(ch)
    end
  end

  puts result.join
end
