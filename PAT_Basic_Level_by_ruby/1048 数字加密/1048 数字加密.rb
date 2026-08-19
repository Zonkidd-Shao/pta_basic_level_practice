# 1048 数字加密
#
# 题目描述：
#   本题要求实现一种数字加密方法。首先固定一个加密用正整数 A，对任一正整数 B，将其每 1 位数字与 A 的对应位置上的数字进行以下运算：对奇数位，对应位的数字相加后对 13 取余——这里用 J 代表 10、Q 代表 11、K 代表 12；对偶数位，用 B 的数字减去 A 的数字，若结果为负数，则再加 10。这里令个位为第 1 位。
#
# 实现原理：
#   按特定规则对每一位数字进行加密；处理奇偶位的不同加密方式；补全较短的数字串后逐位加密
#

MAP = %w[0 1 2 3 4 5 6 7 8 9 J Q K].freeze

if __FILE__ == $PROGRAM_NAME
  a, b = gets.split
  a_rev = a.reverse
  b_rev = b.reverse
  max_len = [a.length, b.length].max

  result = []
  (0...max_len).each do |i|
    av = i < a_rev.length ? a_rev[i].to_i : 0
    bv = i < b_rev.length ? b_rev[i].to_i : 0
    pos = i + 1
    if pos.odd?
      result << MAP[(av + bv) % 13]
    else
      c = bv - av
      c += 10 while c.negative?
      result << c.to_s
    end
  end

  puts result.reverse.join
end
