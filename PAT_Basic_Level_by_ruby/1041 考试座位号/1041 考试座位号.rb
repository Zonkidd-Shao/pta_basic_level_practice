# 1041 考试座位号
#
# 题目描述：
#   每个 PAT 考生在参加考试时都会被分配两个座位号，一个是试机座位，一个是考试座位。正常情况下，考生在入场时先得到试机座位号码，入座进入试机状态后，系统会显示该考生的考试座位号码，考试时考生需要换到考试座位就座。但有些考生迟到了，试机已经结束，他们只能拿着领到的试机座位号码求助于你，从后台查出他们的考试座位号码。
#
# 实现原理：
#   使用哈希表建立试机号与座位号的映射；根据试机号快速查询座位号；处理多个查询请求
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  map = {}
  n.times do
    ticket, test_seat, exam_seat = gets.split
    map[test_seat] = [ticket, exam_seat]
  end

  m = gets.to_i
  queries = gets.split
  queries.each do |q|
    ticket, exam = map[q]
    puts "#{ticket} #{exam}"
  end
end
