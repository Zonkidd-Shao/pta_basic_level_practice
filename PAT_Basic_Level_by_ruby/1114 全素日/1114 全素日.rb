# 1114 全素日
#
# 题目描述：
#   ![wbfg.JPG](~/f4c6f880-b7ed-4893-b10f-045937586870.JPG)
#   以上图片来自新浪微博，展示了一个非常酷的“全素日”：2019年5月23日。即不仅`20190523`本身是个素数，它的任何以末尾数字`3`结尾的子串都是素数。
#   本题就请你写个程序判断一个给定日期是否是“全素日”。
#
# 实现原理：
#   判断一个日期是否所有部分都是素数；依次检查年、月、日及其组合是否为素数；素数判断和日期验证
#

require 'date'
require 'set'

if __FILE__ == $PROGRAM_NAME
  start_s, end_s = gets.split
  primes = Set.new(%w[2 3 5 7])
  d = Date.parse(start_s)
  end_d = Date.parse(end_s)
  while d <= end_d
    s = d.strftime('%Y%m%d')
    puts d.strftime('%Y-%m-%d') if s.chars.all? { |c| primes.include?(c) }
    d = d.next_day
  end
end
