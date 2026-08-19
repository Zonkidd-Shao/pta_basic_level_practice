# 1107 老鼠爱大米
#
# 题目描述：
#   翁恺老师曾经设计过一款 Java 挑战游戏，叫“老鼠爱大米”（或许因为他的外号叫“胖胖鼠”）。每个玩家用 Java 代码控制一只鼠，目标是抢吃尽可能多的大米让自己变成胖胖鼠，最胖的那只就是冠军。
#   因为游戏时间不能太长，我们把玩家分成 N 组，每组 M 只老鼠同场竞技，然后从 N 个分组冠军中直接选出最胖的冠军胖胖鼠。现在就请你写个程序来得到冠军的体重。
#
# 实现原理：
#   模拟多轮比赛，每轮淘汰部分选手；找出每轮中吃最多的老鼠晋级；使用排序和分组进行淘汰
#

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)
  weights = gets.split.map(&:to_i)
  eaten = Array.new(n, 0)
  remaining = m
  i = 0

  while remaining.positive?
    w = weights[i]
    eat = [w, remaining].min
    eaten[i] += eat
    remaining -= eat
    i = (i + 1) % n
  end

  puts eaten.join(' ')
end
