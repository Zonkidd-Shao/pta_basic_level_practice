# 1028 人口普查
#
# 题目描述：
#
# 实现原理：
#   验证日期的合法性；找出最年长和最年轻的人；处理无效日期和边界情况
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  min_valid = '1814/09/06'
  max_valid = '2014/09/06'

  count = 0
  oldest = nil
  youngest = nil

  n.times do
    name, date = gets.split
    next if date < min_valid || date > max_valid

    count += 1
    oldest = [name, date] if oldest.nil? || date < oldest[1]
    youngest = [name, date] if youngest.nil? || date > youngest[1]
  end

  if count.zero?
    puts 0
  else
    puts count
    puts "#{youngest[0]} #{oldest[0]}"
  end
end
