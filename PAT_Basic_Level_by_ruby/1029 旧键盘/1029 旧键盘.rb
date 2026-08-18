# 1029 旧键盘
#
# 题目描述：
#
# 实现原理：
#   对比期望输出和实际输出的差异；找出缺失的按键；使用集合记录已输出的坏键避免重复
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  expected = gets(chomp: true)
  actual = gets(chomp: true)

  actual_set = actual.upcase.chars.to_set
  seen = Set.new
  broken = []

  expected.upcase.each_char do |ch|
    next if actual_set.include?(ch)
    next if seen.include?(ch)

    seen.add(ch)
    broken << ch
  end

  puts broken.join
end
