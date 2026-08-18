# 1104 天长地久
#
# 题目描述：
#   “天长地久数”是指一个 K 位正整数 A，其满足条件为：A 的各位数字之和为 m，A+1 的各位数字之和为 n，且 m 与 n 的最大公约数是一个大于 2 的素数。本题就请你找出这些天长地久数。
#
# 实现原理：
#   寻找满足各位数字和为A且是K倍数的数；数字按位递增，满足约束条件；枚举或数学推导寻找符合条件的数
#

if __FILE__ == $PROGRAM_NAME
  n, k = gets.split.map(&:to_i)
  if k < 1 || k > 9 * n
    puts 'No'
  else
    digits = Array.new(n, 0)
    remaining = k
    (n - 1).downto(0) do |i|
      if i.zero?
        digits[i] = remaining
      else
        take = [9, remaining - 1].min # 为首位至少留 1
        digits[i] = take
        remaining -= take
      end
    end
    puts digits.join
  end
end
