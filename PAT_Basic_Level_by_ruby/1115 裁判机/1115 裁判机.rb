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
  expr = gets(chomp: true)
  a, op, b = expr.split
  a = a.to_f
  b = b.to_f
  correct = case op
            when '+' then a + b
            when '-' then a - b
            when '*' then a * b
            when '/' then a / b
            end

  n = gets.to_i
  n.times do
    ans = gets.to_f
    puts((ans - correct).abs < 1e-9 ? 'Yes' : 'No')
  end
end
