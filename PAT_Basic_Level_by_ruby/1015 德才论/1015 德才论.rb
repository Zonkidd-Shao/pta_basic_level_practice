# 1015 德才论
#
# 题目描述：
#   宋代史学家司马光在《资治通鉴》中有一段著名的“德才论”：“是故才德全尽谓之圣人，才德兼亡谓之愚人，德胜才谓之君子，才胜德谓之小人。凡取人之术，苟不得圣人，君子而与之，与其得小人，不若得愚人。”
#   现给出一批考生的德才分数，请根据司马光的理论给出录取排名。
#
# 实现原理：
#   根据德分和才分对考生进行分类；按总分和德分进行多关键字排序；输出各类别的考生信息
#

if __FILE__ == $PROGRAM_NAME
  n, l, h = gets.split.map(&:to_i)

  students = []
  n.times do
    id, de, cai = gets.split
    de = de.to_i
    cai = cai.to_i
    next if de < l || cai < l

    cls = if de >= h && cai >= h
            1
          elsif de >= h
            2
          elsif de >= cai
            3
          else
            4
          end
    students << { id: id, de: de, cai: cai, total: de + cai, cls: cls }
  end

  students.sort_by! { |s| [s[:cls], -s[:total], -s[:de], s[:id]] }

  puts students.length
  students.each do |s|
    puts "#{s[:id]} #{s[:de]} #{s[:cai]}"
  end
end
