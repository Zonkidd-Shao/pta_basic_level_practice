# 1115 裁判机
#
# 题目描述：
#   有一种数字游戏的规则如下：首先由裁判给定两个不同的正整数，然后参加游戏的几个人轮流给出正整数。要求给出的数字必须是前面已经出现的某两个正整数之差，且不能等于之前的任何一个数。游戏一直持续若干轮，中间有写重复或写错的人就出局。
#   本题要求你实现这个游戏的裁判机，自动判断每位游戏者给出的数字是否合法，以及最后的赢家。
#
# 实现原理：
#   模拟裁判系统判断玩家输赢；根据手势相克关系判定胜负；统计各玩家的胜负情况
#

if __FILE__ == $PROGRAM_NAME
  x, y = gets.split.map(&:to_i)
  n, m = gets.split.map(&:to_i)
  answers = n.times.map { gets.split.map(&:to_i) }
  seen = { x => true, y => true }
  valid = { (x - y).abs => true }
  alive = (0...n).to_a

  m.times do |round|
    out = []
    alive.each do |i|
      value = answers[i][round]
      if seen.key?(value) || !valid.key?(value)
        out << i
      else
        seen.each_key { |old| valid[(value - old).abs] = true }
        seen[value] = true
      end
    end
    out.each { |i| puts "Round ##{round + 1}: #{i + 1} is out." }
    alive -= out
  end
  puts(alive.empty? ? 'No winner.' : "Winner(s): #{alive.map { |i| i + 1 }.join(' ')}")
end
