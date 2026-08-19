# 1057 数零壹
#
# 题目描述：
#   给定一串长度不超过 10^5 的字符串，本题要求你将其中所有英文字母的序号（字母 a-z 对应序号 1-26，不分大小写）相加，得到整数 N，然后再分析一下 N 的二进制表示中有多少 0、多少 1。例如给定字符串 `PAT (Basic)`，其字母序号之和为：16+1+20+2+1+19+9+3=71，而 71 的二进制是 1000111，即有 3 个 0、4 个 1。
#
# 实现原理：
#   统计字符串中0和1的个数；将0和1的个数转换为二进制；输出二进制表示结果
#

if __FILE__ == $PROGRAM_NAME
  s = gets(chomp: true)

  total = 0
  s.each_char do |ch|
    next unless ch =~ /[a-zA-Z]/

    total += ch.downcase.ord - 'a'.ord + 1
  end

  binary = total.to_s(2)
  zeros = binary.count('0')
  ones = binary.count('1')
  puts "#{zeros} #{ones}"
end
