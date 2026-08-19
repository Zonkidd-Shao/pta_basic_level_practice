# 1037 在霍格沃茨找零钱
#
# 题目描述：
#   如果你是哈利·波特迷，你会知道魔法世界有它自己的货币系统 —— 就如海格告诉哈利的：“十七个银西可(Sickle)兑一个加隆(Galleon)，二十九个纳特(Knut)兑一个西可，很容易。”现在，给定哈利应付的价钱 P 和他实付的钱 A，你的任务是写一个程序来计算他应该被找的零钱。
#
# 实现原理：
#   使用特殊的货币进制（17和29）；计算找零金额（应付-实付）；处理负数情况和进位借位
#

GALLEON_IN_KNUT = 17 * 29

# 将 G.S.K 转为 Knut 总数
# @param str [String]
# @return [Integer]
def to_knut(str)
  g, s, k = str.split('.').map(&:to_i)
  (g * 17 + s) * 29 + k
end

if __FILE__ == $PROGRAM_NAME
  paid, price = gets.split
  diff = to_knut(paid) - to_knut(price)
  negative = diff.negative?
  diff = diff.abs

  galleon = diff / GALLEON_IN_KNUT
  remainder = diff % GALLEON_IN_KNUT
  sickle = remainder / 29
  knut = remainder % 29
  puts "#{negative ? '-' : ''}#{galleon}.#{sickle}.#{knut}"
end
