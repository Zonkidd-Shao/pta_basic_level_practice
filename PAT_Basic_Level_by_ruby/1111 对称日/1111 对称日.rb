# 1111 对称日
#
# 题目描述：
#   ![SymDay.JPG](~/52ab2251-4e68-42c1-a5a7-ad3f7589f5c1.JPG)
#   央视新闻发了一条微博，指出 2020 年有个罕见的“对称日”，即 2020 年 2 月 2 日，按照 `年年年年月月日日` 格式组成的字符串 20200202 是完全对称的。
#   给定任意一个日期，本题就请你写程序判断一下，这是不是一个对称日？
#
# 实现原理：
#   判断一个日期字符串是否为回文；验证日期的合法性；统计一年中有多少个对称日
#

if __FILE__ == $PROGRAM_NAME
  months = {
    'Jan' => 1, 'Feb' => 2, 'Mar' => 3, 'Apr' => 4, 'May' => 5, 'Jun' => 6,
    'Jul' => 7, 'Aug' => 8, 'Sep' => 9, 'Oct' => 10, 'Nov' => 11, 'Dec' => 12
  }
  n = gets.to_i
  n.times do
    month, day, year = gets.delete(',').split
    date = format('%04d%02d%02d', year.to_i, months[month], day.to_i)
    puts "#{date == date.reverse ? 'Y' : 'N'} #{date}"
  end
end
