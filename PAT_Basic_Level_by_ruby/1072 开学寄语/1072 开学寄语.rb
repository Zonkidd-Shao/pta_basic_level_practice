# 1072 开学寄语
#
# 题目描述：
#   下图是上海某校的新学期开学寄语：天将降大任于斯人也，必先删其微博，卸其 QQ，封其电脑，夺其手机，收其 ipad，断其 wifi，使其百无聊赖，然后，净面、理发、整衣，然后思过、读书、锻炼、明智、开悟、精进。而后必成大器也！
#   ![jiyu.JPG](~/3b1d9f4a-778b-4942-a9e2-836262f363aa.JPG)
#   本题要求你写个程序帮助这所学校的老师检查所有学生的物品，以助其成大器。
#
# 实现原理：
#   检查学生物品是否在违禁品列表中；统计有违禁品的学生人数和违禁品总数；输出每个学生的检查结果
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  n, _m = gets.split.map(&:to_i)
  forbidden = gets.split.to_set
  students_with_items = 0
  confiscated = 0

  n.times do
    parts = gets.split
    name = parts[0]
    k = parts[1].to_i
    items = parts[2, k]
    found = items.select { |it| forbidden.include?(it) }
    unless found.empty?
      puts "#{name}: #{found.join(' ')}"
      students_with_items += 1
      confiscated += found.length
    end
  end
  puts "#{students_with_items} #{confiscated}"
end
