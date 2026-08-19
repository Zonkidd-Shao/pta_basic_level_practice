# 1054 求平均值
#
# 题目描述：
#   拍集体照时队形很重要，这里对给定的 N 个人 K 排的队形设计排队规则如下：
#   - 每排人数为 N/K（向下取整），多出来的人全部站在最后一排；
#   - 后排所有人的个子都不比前排任何人矮；
#   - 每排中最高者站中间（中间位置为 m/2+1，其中 m 为该排人数，除法向下取整）；
#   - 每排其他人以中间人为轴，按身高非增序，先右后左交替入队站在中间人的两侧（例如5人身高为190、188、186、175、170，则队形为175、188、190、186、170。这里假设你面对拍照者，所以你的左边是中间人的右边）；
#   - 若多人身高相同，则按名字的字典序升序排列。这里保证无重名。
#   现给定一组拍照人，请编写程序输出他们的队形。
#
# 实现原理：
#   验证输入数字的合法性；统计合法数字并计算平均值；处理非法输入的边界情况
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  strs = gets.split

  valid = []
  strs.each do |s|
    if s =~ /^-?\d+(\.\d{1,2})?$/
      num = s.to_f
      valid << num if num >= -1000 && num <= 1000
    end
  end

  count = valid.length
  if count.zero?
    puts 'The average of 0 numbers is undefined'
  elsif count == 1
    puts "The average of 1 number is #{format('%.2f', valid[0])}"
  else
    avg = valid.sum / count
    puts "The average of #{count} numbers is #{format('%.2f', avg)}"
  end
end
