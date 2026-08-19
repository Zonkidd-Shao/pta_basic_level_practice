# 1074 宇宙无敌加法器
#
# 题目描述：
#   地球人习惯使用十进制数，并且默认一个数字的每一位都是十进制的。而在 PAT 星人开挂的世界里，每个数字的每一位都是不同进制的，这种神奇的数字称为“PAT数”。每个 PAT 星人都必须熟记各位数字的进制表，例如“……0527”就表示最低位是 7 进制数、第 2 位是 2 进制数、第 3 位是 5 进制数、第 4 位是 10 进制数，等等。每一位的进制 d 或者是 0（表示十进制）、或者是 [2，9] 区间内的整数。理论上这个进制表应该包含无穷多位数字，但从实际应用出发，PAT 星人通常只需要记住前 20 位就够用了，以后各位默认为 10 进制。
#   在这样的数字系统中，即使是简单的加法运算也变得不简单。例如对应进制表“0527”，该如何计算“6203 + 415”呢？我们得首先计算最低位：3 + 5 = 8；因为最低位是 7 进制的，所以我们得到 1 和 1 个进位。第 2 位是：0 + 1 + 1（进位）= 2；因为此位是 2 进制的，所以我们得到 0 和 1 个进位。第 3 位是：2 + 4 + 1（进位）= 7；因为此位是 5 进制的，所以我们得到 2 和 1 个进位。第 4 位是：6 + 1（进位）= 7；因为此位是 10 进制的，所以我们就得到 7。最后我们得到：6203 + 415 = 7201。
#
# 实现原理：
#   实现特殊进制的加法运算；每一位的进制可能不同；从低位到高位逐位相加并处理进位
#

if __FILE__ == $PROGRAM_NAME
  radix = gets(chomp: true)
  a = gets(chomp: true)
  b = gets(chomp: true)

  a_rev = a.reverse
  b_rev = b.reverse
  result = []
  carry = 0
  max_len = [a.length, b.length].max

  (0...max_len).each do |i|
    av = i < a_rev.length ? a_rev[i].to_i : 0
    bv = i < b_rev.length ? b_rev[i].to_i : 0

    if i < radix.length
      base = radix[radix.length - 1 - i].to_i
      base = 10 if base.zero?
    else
      base = 10
    end

    sum = av + bv + carry
    result << sum % base
    carry = sum / base
  end
  result << carry if carry.positive?

  str = result.reverse.join.sub(/\A0+(?=\d)/, '')
  puts str.empty? ? '0' : str
end
