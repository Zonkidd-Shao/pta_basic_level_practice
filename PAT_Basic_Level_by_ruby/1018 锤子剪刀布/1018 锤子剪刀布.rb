# 1018 锤子剪刀布
#
# 题目描述：
#   大家应该都会玩“锤子剪刀布”的游戏：两人同时给出手势，胜负规则如图所示：
#   ![alt text](image.png)
#   现给出两人的交锋记录，请统计双方的胜、平、负次数，并且给出双方分别出什么手势的胜算最大。
#
# 实现原理：
#   统计甲乙双方的胜负情况；找出各自胜率最高的手势；使用计数数组统计各手势的胜场
#

# key 手势战胜 value 手势：B(布) > C(锤)，C(锤) > J(剪)，J(剪) > B(布)
WINS = { 'B' => 'C', 'C' => 'J', 'J' => 'B' }.freeze

# 求获胜次数最多的手势；无胜场返回 '-'；并列取字母序最小
# @param gesture [Hash]
# @return [String]
def best_gesture(gesture)
  max = gesture.values.max || 0
  return '-' if max.zero?

  %w[B C J].select { |g| gesture[g] == max }.min
end

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  a_win = a_draw = a_lose = 0
  a_gesture = Hash.new(0) # 甲获胜时使用的手势计数
  b_gesture = Hash.new(0) # 乙获胜时使用的手势计数

  n.times do
    x, y = gets.split
    if x == y
      a_draw += 1
    elsif WINS[x] == y
      a_win += 1
      a_gesture[x] += 1
    else
      a_lose += 1
      b_gesture[y] += 1
    end
  end

  puts "#{a_win} #{a_draw} #{a_lose}"
  puts "#{a_lose} #{a_draw} #{a_win}"
  puts "#{best_gesture(a_gesture)} #{best_gesture(b_gesture)}"
end
