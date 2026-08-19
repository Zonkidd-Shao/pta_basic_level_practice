# 1004 成绩排名
#
# 题目描述：
#   读入 n（>0）名学生的姓名、学号、成绩，分别输出成绩最高和成绩最低学生的姓名和学号。
#
# 实现原理：
#   使用结构体或数组存储学生信息；按成绩进行排序；找出最高分和最低分学生
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  max_student = nil
  min_student = nil
  max_score = -1
  min_score = 101

  n.times do
    name, id, score_str = gets.split
    score = score_str.to_i
    if score > max_score
      max_score = score
      max_student = [name, id]
    end
    next unless score < min_score

    min_score = score
    min_student = [name, id]
  end

  puts max_student.join(' ')
  puts min_student.join(' ')
end
