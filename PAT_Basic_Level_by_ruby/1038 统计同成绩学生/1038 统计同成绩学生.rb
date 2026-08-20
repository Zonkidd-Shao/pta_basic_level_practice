# 1038 统计同成绩学生
#
# 题目描述：
#   本题要求读入 N 名学生的成绩，将获得某一给定分数的学生人数输出。
#
# 实现原理：
#   使用计数数组或哈希表统计各分数人数；直接查询目标分数的人数；利用数组下标快速访问
#

if __FILE__ == $PROGRAM_NAME
  data = STDIN.read.split.map(&:to_i)
  n = data.shift
  scores = data.shift(n)

  counts = Array.new(101, 0)
  scores.each { |s| counts[s] += 1 }

  k = data.shift
  queries = data.shift(k)
  puts queries.map { |q| counts[q] }.join(' ')
end
