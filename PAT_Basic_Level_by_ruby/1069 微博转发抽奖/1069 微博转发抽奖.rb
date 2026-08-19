# 1069 微博转发抽奖
#
# 题目描述：
#   小明 PAT 考了满分，高兴之余决定发起微博转发抽奖活动，从转发的网友中按顺序每隔 N 个人就发出一个红包。请你编写程序帮助他确定中奖名单。
#
# 实现原理：
#   按间隔从转发列表中抽取中奖者；使用集合记录已中奖的人，跳过重复中奖；处理获奖者序号超出范围的情况
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  n, m, s = gets.split.map(&:to_i)
  ids = gets.split

  winners = []
  won = Set.new
  idx = s - 1
  while idx < n
    id = ids[idx]
    if won.include?(id)
      idx += 1
    else
      winners << id
      won.add(id)
      idx += m
    end
  end

  if winners.empty?
    puts 'Keep going...'
  else
    puts winners.join("\n")
  end
end
