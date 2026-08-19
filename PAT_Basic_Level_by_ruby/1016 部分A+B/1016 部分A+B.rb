# 1016 部分A+B
#
# 题目描述：
#   正整数 A 的“D_A（为 1 位整数）部分”定义为由 A 中所有 D_A 组成的新整数 P_A。例如：给定 A = 3862767，D_A = 6，则 A 的“6 部分”P_A 是 66，因为 A 中有 2 个 6。
#   现给定 A、D_A、B、D_B，请编写程序计算 P_A + P_B。
#
# 实现原理：
#   统计数字A中D_A出现的次数构造P_A；同理构造P_B并求和；利用数字重复出现的规律计算
#

# 由数字字符串 a 和单数字 da 组成 PA
# @param a [String]
# @param da [String] 单字符数字
# @return [Integer]
def partial(a, da)
  count = a.count(da)
  count.zero? ? 0 : (da * count).to_i
end

if __FILE__ == $PROGRAM_NAME
  a, da, b, db = gets.split
  puts partial(a, da) + partial(b, db)
end
