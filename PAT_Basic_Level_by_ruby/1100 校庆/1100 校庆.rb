# 1100 校庆
#
# 题目描述：
#   2019 年浙江大学将要庆祝成立 122 周年。为了准备校庆，校友会收集了所有校友的身份证号。现在需要请你编写程序，根据来参加校庆的所有人士的身份证号，统计来了多少校友。
#
# 实现原理：
#   使用集合存储校友的身份证号；统计到场校友人数并找出最年长的；利用生日信息判断年龄大小
#
require 'set'

if __FILE__ == $PROGRAM_NAME
  data = STDIN.read.split
  n = data.shift.to_i
  alumni = data.shift(n).to_set
  m = data.shift.to_i
  attendees = data.shift(m)
  attending = attendees.select { |id| alumni.include?(id) }
  candidates = attending.empty? ? attendees : attending
  oldest = candidates.min_by { |id| id[6, 8] }

  puts attending.length
  puts oldest
end
