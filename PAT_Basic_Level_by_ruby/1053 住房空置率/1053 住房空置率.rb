# 1053 住房空置率
#
# 题目描述：
#   在不打扰居民的前提下，统计住房空置率的一种方法是根据每户用电量的连续变化规律进行判断。判断方法如下：
#   - 在观察期内，若存在超过一半的日子用电量低于某给定的阈值 e，则该住房为“可能空置”；
#   - 若观察期超过某给定阈值 D 天，且满足上一个条件，则该住房为“空置”。
#   现给定某居民区的住户用电量数据，请你统计“可能空置”的比率和“空置”比率，即以上两种状态的住房占居民区住房总套数的百分比。
#
# 实现原理：
#   统计可能空置和空置的住房数量；根据用电量低于阈值的天数判断；计算空置率并输出百分比
#

if __FILE__ == $PROGRAM_NAME
  header = gets.split
  n = header[0].to_i
  e = header[1].to_f
  d = header[2].to_i

  maybe = 0
  vacant = 0
  n.times do
    days = gets.split.map(&:to_f)
    low = days.count { |u| u < e }
    if low * 2 > d
      vacant += 1
    elsif low.positive?
      maybe += 1
    end
  end

  puts "#{maybe} #{vacant}"
  puts format('%.1f%%', vacant * 100.0 / n)
end
