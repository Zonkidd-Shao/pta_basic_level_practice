# 1042 字符统计
#
# 题目描述：
#   请编写程序，找出一段给定文字中出现最频繁的那个英文字母。
#
# 实现原理：
#   统计字符串中各字母的出现次数；不区分大小写；找出出现次数最多的字母及其次数
#

if __FILE__ == $PROGRAM_NAME
  s = gets(chomp: true)

  counts = Hash.new(0)
  s.each_char do |ch|
    counts[ch.downcase] += 1 if ch =~ /[a-zA-Z]/
  end

  max_count = counts.values.max
  best = counts.keys.select { |k| counts[k] == max_count }.min
  puts "#{best} #{counts[best]}"
end
