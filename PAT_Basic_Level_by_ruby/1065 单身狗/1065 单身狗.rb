# 1065 单身狗
#
# 题目描述：
#   “单身狗”是中文对于单身人士的一种爱称。本题请你从上万人的大型派对中找出落单的客人，以便给予特殊关爱。
#
# 实现原理：
#   使用数组或哈希表记录伴侣关系；在派对人群中找出没有伴侣的人；按编号顺序输出单身狗
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  partner = {}
  n.times do
    a, b = gets.split
    partner[a] = b
    partner[b] = a
  end

  m = gets.to_i
  attendees = gets.split
  attend_set = attendees.to_set

  lonely = attendees.select do |id|
    p = partner[id]
    p.nil? || !attend_set.include?(p)
  end

  lonely.sort!
  puts lonely.length
  puts lonely.join(' ')
end
