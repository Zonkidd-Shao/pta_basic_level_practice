# 1043 输出PATest
#
# 题目描述：
#   给定一个长度不超过 10^4 的、仅由英文字母构成的字符串。请将字符重新调整顺序，按 `PATestPATest....` 这样的顺序输出，并忽略其它字符。当然，六种字符的个数不一定是一样多的，若某种字符已经输出完，则余下的字符仍按 PATest 的顺序打印，直到所有字符都被输出。
#
# 实现原理：
#   统计P、A、T、e、s、t各字符的数量；按PATest顺序循环输出字符；直到所有字符都用完
#

if __FILE__ == $PROGRAM_NAME
  s = gets(chomp: true)
  order = 'PATest'.chars
  counts = s.chars.tally

  result = []
  loop do
    any = false
    order.each do |ch|
      next unless counts[ch] && counts[ch].positive?

      result << ch
      counts[ch] -= 1
      any = true
    end
    break unless any
  end

  puts result.join
end
