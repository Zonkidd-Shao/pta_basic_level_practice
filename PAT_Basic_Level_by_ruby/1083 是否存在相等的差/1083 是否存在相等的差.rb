# 1083 是否存在相等的差
#
# 题目描述：
#   给定 N 张卡片，正面分别写上 1、2、……、N，然后全部翻面，洗牌，在背面分别写上 1、2、……、N。将每张牌的正反两面数字相减（大减小），得到 N 个非负差值，其中是否存在相等的差？
#
# 实现原理：
#   计算每个元素与其位置的差值的绝对值；统计各差值出现的次数；按差值从大到小输出出现次数>=2的
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  counts = Hash.new(0)
  n.times do |i|
    v = gets.to_i
    diff = (v - (i + 1)).abs
    counts[diff] += 1
  end

  counts.select { |_, c| c > 1 }
       .sort.reverse
       .each { |diff, c| puts "#{diff} #{c}" }
end
