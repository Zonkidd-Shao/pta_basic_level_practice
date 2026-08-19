# 1073 多选题常见计分法
#
# 题目描述：
#   批改多选题是比较麻烦的事情，有很多不同的计分方法。有一种最常见的计分方法是：如果考生选择了部分正确选项，并且没有选择任何错误选项，则得到 50% 分数；如果考生选择了任何一个错误的选项，则不能得分。本题就请你写个程序帮助老师批改多选题，并且指出哪道题的哪个选项错的人最多。
#
# 实现原理：
#   实现多选题的评分规则（漏选得半分）；统计各题的错误选项和错选人数；计算学生得分并找出错得最多的题
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
    total = 0.0
    m.times do |qi|
      cnt = parts[idx].to_i
      ans = parts[idx + 1, cnt].to_set
      idx += 1 + cnt
      q = questions[qi]
      if ans == q[:correct]
        total += q[:full]
      elsif !ans.empty? && ans.subset?(q[:correct])
        total += q[:full] / 2.0
      else
        wrong[qi] += 1
      end
    end
    scores << total
  end

  scores.each { |s| puts format('%.1f', s) }

  max_wrong = wrong.max
  if max_wrong.zero?
    puts 'Too simple'
  else
    res = []
    wrong.each_with_index { |w, i| res << (i + 1) if w == max_wrong }
    puts res.join(' ')
  end
end
