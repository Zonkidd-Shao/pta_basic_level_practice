# 1100 校庆
#
# 题目描述：
#   2019 年浙江大学将要庆祝成立 122 周年。为了准备校庆，校友会收集了所有校友的身份证号。现在需要请你编写程序，根据来参加校庆的所有人士的身份证号，统计来了多少校友。
#
# 实现原理：
#   使用集合存储校友的身份证号；统计到场校友人数并找出最年长的；利用生日信息判断年龄大小
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  alumni = {}
  n.times do
    name, birthday = gets.split
    alumni[name] = birthday
  end

  m = gets.to_i
  attendees = []
  m.times do
    name, birthday = gets.split
    attendees << [name, birthday]
  end

  attending_alumni = attendees.select { |name, _| alumni.key?(name) }
  oldest_alum = attending_alumni.min_by { |_, b| b }
  oldest_attendee = attendees.min_by { |_, b| b }

  puts attending_alumni.length
  puts "#{oldest_alum[0]} #{oldest_alum[1]}" if oldest_alum
  puts "#{oldest_attendee[0]} #{oldest_attendee[1]}"
end
