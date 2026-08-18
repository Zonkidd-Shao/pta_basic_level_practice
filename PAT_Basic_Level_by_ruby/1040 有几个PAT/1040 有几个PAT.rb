# 1040 有几个PAT
#
# 题目描述：
#   字符串 `APPAPT` 中包含了两个单词 `PAT`，其中第一个 `PAT` 是第 2 位(`P`)，第 4 位(`A`)，第 6 位(`T`)；第二个 `PAT` 是第 3 位(`P`)，第 4 位(`A`)，第 6 位(`T`)。
#   现给定字符串，问一共可以形成多少个 `PAT`？
#
# 实现原理：
#   使用动态规划思想统计PAT个数；遍历字符串，累计P、PA、PAT的数量；遇到A时累加到PA，遇到T时累加到PAT
#

MOD = 1_000_000_007

if __FILE__ == $PROGRAM_NAME
  s = gets(chomp: true)
  p_count = 0
  pat_with_a = 0
  total = 0

  s.each_char do |ch|
    case ch
    when 'P'
      p_count += 1
    when 'A'
      pat_with_a = (pat_with_a + p_count) % MOD
    when 'T'
      total = (total + pat_with_a) % MOD
    end
  end

  puts total
end
