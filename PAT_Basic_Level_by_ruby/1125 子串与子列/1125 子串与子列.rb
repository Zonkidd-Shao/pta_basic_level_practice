# 1125 子串与子列
#
# 题目描述：
#   现给定一个字符串 S 和一个子列 P，本题就请你找到 S 中包含 P 的最短子串。若解不唯一，则输出起点最靠左边的解。
#
# 实现原理：
#   比较子串和子序列的区别；计算最长公共子串或子序列；动态规划或字符串匹配算法
#

# 判断 t 是否为 s 的子序列
# @param s [String]
# @param t [String]
# @return [Boolean]
# 判断字符串 s 是否为字符串 t 的子序列
#
# @param s [String] 待判断的子序列字符串
# @param t [String] 目标字符串
# @return [Boolean] 若 s 是 t 的子序列则返回 true，否则返回 false
def subsequence?(s, t)
  i = 0
  t.each_char do |c|
    i = s.index(c, i)
    return false if i.nil?

    i += 1
  end
  true
end

if __FILE__ == $PROGRAM_NAME
  s = gets(chomp: true)
  t = gets(chomp: true)

  if s.include?(t)
    puts 'substring'
  elsif subsequence?(s, t)
    puts 'subsequence'
  else
    puts 'None'
  end
end
