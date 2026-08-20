# 1108 String复读机
#
# 题目描述：
#   给定一个长度不超过 10^4 的、仅由英文字母构成的字符串。请将字符重新调整顺序，按 `StringString....` （注意区分大小写）这样的顺序输出，并忽略其它字符。当然，六种字符的个数不一定是一样多的，若某种字符已经输出完，则余下的字符仍按 `String` 的顺序打印，直到所有字符都被输出。例如 `gnirtSSs` 要调整成 `StringS` 输出，其中 `s` 是多余字符被忽略。
#
# 实现原理：
#   按字符串顺序循环输出字符；统计每个字符可用的次数；按原字符串顺序消耗字符直到用完
#

if __FILE__ == $PROGRAM_NAME
  s = gets(chomp: true)
  counts = Hash.new(0)
  s.each_char { |c| counts[c] += 1 }
  result = String.new
  loop do
    wrote = false
    'String'.each_char do |c|
      next if counts[c].zero?

      result << c
      counts[c] -= 1
      wrote = true
    end
    break unless wrote
  end
  puts result
end
