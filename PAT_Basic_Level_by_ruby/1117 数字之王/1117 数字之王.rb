# 1117 数字之王
#
# 题目描述：
#   给定两个正整数 N_1 < N_2。把从 N_1 到 N_2 的每个数的各位数的立方相乘，再将结果的各位数求和，得到一批新的数字，再对这批新的数字重复上述操作，直到所有数字都是 1 位数为止。这时哪个数字最多，哪个就是“数字之王”。
#   例如 N_1=1 和 N_2=10 时，第一轮操作后得到 { 1, 8, 9, 10, 8, 9, 10, 8, 18, 0 }；第二轮操作后得到 { 1, 8, 18, 0, 8, 18, 0, 8, 8, 0 }；第三轮操作后得到 { 1, 8, 8, 0, 8, 8, 0, 8, 8, 0 }。所以数字之王就是 8。
#   本题就请你对任意给定的 N_1 < N_2 求出对应的数字之王。
#
# 实现原理：
#   找出数字中出现次数最多的位；如果有并列则取最大的那个数字；统计各数字出现次数并排序
#

if __FILE__ == $PROGRAM_NAME
  n1, n2 = gets.split.map(&:to_i)
  values = (n1..n2).to_a
  while values.any? { |value| value >= 10 }
    values.map! do |value|
      product = value.digits.inject(1) { |acc, digit| acc * digit**3 }
      product.digits.sum
    end
  end
  counts = values.tally
  maximum = counts.values.max
  puts maximum
  puts counts.select { |_, count| count == maximum }.keys.sort.join(' ')
end
