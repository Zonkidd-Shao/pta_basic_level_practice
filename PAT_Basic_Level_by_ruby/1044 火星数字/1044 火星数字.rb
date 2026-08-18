# 1044 火星数字
#
# 题目描述：
#   火星人是以 13 进制计数的：
#   - 地球人的 0 被火星人称为 tret。
#   - 地球人数字 1 到 12 的火星文分别为：jan, feb, mar, apr, may, jun, jly, aug, sep, oct, nov, dec。
#   - 火星人将进位以后的 12 个高位数字分别称为：tam, hel, maa, huh, tou, kes, hei, elo, syy, lok, mer, jou。
#   例如地球人的数字 `29` 翻译成火星文就是 `hel mar`；而火星文 `elo nov` 对应地球数字 `115`。为了方便交流，请你编写程序实现地球和火星数字之间的互译。
#
# 实现原理：
#   实现地球数字与火星数字的相互转换；火星数字使用特殊的进制和表示法；处理高低位的火星文字符串
#

UNIT = %w[tret jan feb mar apr may jun jly aug sep oct nov dec].freeze
TEN = %w[tam hel maa hua tou kes coo low tan tite tony].freeze

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  n.times do
    line = gets(chomp: true)
    if line =~ /^\d+$/
      num = line.to_i
      if num.zero?
        puts 'tret'
      else
        t = num / 13
        u = num % 13
        parts = []
        parts << TEN[t - 1] if t.positive?
        parts << UNIT[u] if u.positive?
        puts parts.join(' ')
      end
    else
      words = line.split
      if words.length == 1
        idx = UNIT.index(words[0])
        if idx
          puts idx
        else
          puts (TEN.index(words[0]) + 1) * 13
        end
      else
        t = TEN.index(words[0]) + 1
        u = UNIT.index(words[1])
        puts t * 13 + u
      end
    end
  end
end
