# 1090 危险品装箱
#
# 题目描述：
#   集装箱运输货物时，我们必须特别小心，不能把不相容的货物装在一只箱子里。比如氧化剂绝对不能跟易燃液体同箱，否则很容易造成爆炸。
#   本题给定一张不相容物品的清单，需要你检查每一张集装箱货品清单，判断它们是否能装在同一只箱子里。
#
# 实现原理：
#   使用哈希表记录不相容的物品对；检查每个集装箱中是否有不相容物品；快速查找判断是否安全
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)
  incompat = Hash.new { |h, k| h[k] = Set.new }
  n.times do
    a, b = gets.split.map(&:to_i)
    incompat[a] << b
    incompat[b] << a
  end

  m.times do
    parts = gets.split
    k = parts[0].to_i
    items = parts[1, k]
    set = items.to_set
    unsafe = items.any? { |it| incompat[it].any? { |other| set.include?(other) } }
    puts unsafe ? 'No' : 'Yes'
  end
end
