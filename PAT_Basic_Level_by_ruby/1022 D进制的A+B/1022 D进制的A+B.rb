# 1022 D进制的A+B
#
# 题目描述：
#   输入两个非负 10 进制整数 A 和 B (\le 2^{30} -1)，输出 A+B 的 D (1 < D \le 10)进制数。
#
# 实现原理：
#   先计算A+B的十进制和；使用除基取余法将结果转换为D进制；逆序输出余数得到转换结果
#

if __FILE__ == $PROGRAM_NAME
  a, b, d = gets.split.map(&:to_i)
  sum = a + b

  if sum.zero?
    puts 0
  else
    # 反复取模得到 D 进制各位（低位在前），最后逆序输出
    digits = []
    while sum.positive?
      digits << sum % d
      sum /= d
    end
    puts digits.reverse.join
  end
end
