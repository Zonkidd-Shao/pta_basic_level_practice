# 1021 个位数统计
#
# 题目描述：
#   给定一个 k 位整数 N = d_{k-1}10^{k-1} + \cdots + d_1 10^1 + d_0 (0\le d_i \le 9, i=0,\cdots ,k-1, d_{k-1}>0)，请编写程序统计每种不同的个位数字出现的次数。例如：给定 N = 100311，则有 2 个 0，3 个 1，和 1 个 3。
#
# 实现原理：
#   逐位读取数字并统计各数字出现次数；使用计数数组存储0-9的出现次数；按数字顺序输出统计结果
#

if __FILE__ == $PROGRAM_NAME
  n = gets(chomp: true)

  counts = Hash.new(0)
  n.each_char { |ch| counts[ch.to_i] += 1 }

  (0..9).each do |d|
    puts "#{d}:#{counts[d]}" if counts[d] > 0
  end
end
