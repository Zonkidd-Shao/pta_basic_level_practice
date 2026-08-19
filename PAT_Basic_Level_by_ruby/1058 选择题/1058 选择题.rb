# 1058 选择题
#
# 题目描述：
#   批改多选题是比较麻烦的事情，本题就请你写个程序帮助老师批改多选题，并且指出哪道题错的人最多。
#
# 实现原理：
#   解析题目正确答案和学生答案；统计每题的错误情况；计算每个学生的得分
#

require 'set'

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)

  questions = []
  m.times do
    parts = gets.split
    full = parts[0].to_i
    correct_count = parts[2].to_i
    correct = parts[3, correct_count].to_set
    questions << { full: full, correct: correct }
  end

  wrong = Array.new(m, 0)
  scores = []
  n.times do
    parts = gets.split
    idx = 0
    score = 0
    m.times do |qi|
      cnt = parts[idx].to_i
      ans = parts[idx + 1, cnt].to_set
      idx += 1 + cnt
      if ans == questions[qi][:correct]
        score += questions[qi][:full]
      else
        wrong[qi] += 1
      end
    end
    scores << score
  end

  scores.each { |s| puts s }

  max_wrong = wrong.max
  if max_wrong.zero?
    puts 'Too simple'
  else
    result = []
    wrong.each_with_index { |w, i| result << (i + 1) if w == max_wrong }
    puts result.join(' ')
  end
end
