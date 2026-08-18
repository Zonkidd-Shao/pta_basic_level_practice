# 1092 最好吃的月饼
#
# 题目描述：
#   月饼是久负盛名的中国传统糕点之一，自唐朝以来，已经发展出几百品种。
#   ![mk.jpg](~/fcb325a0-7090-4bf4-acb0-d4d7ea832f27.jpg)
#   若想评比出一种“最好吃”的月饼，那势必在吃货界引发一场腥风血雨…… 在这里我们用数字说话，给出全国各地各种月饼的销量，要求你从中找出销量冠军，认定为最好吃的月饼。
#
# 实现原理：
#   使用贪心算法选择单价最高的月饼；按单价从高到低排序；依次装入直到达到总需求量
#

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)
  totals = Array.new(n, 0)
  m.times do
    votes = gets.split.map(&:to_i)
    votes.each_with_index { |v, i| totals[i] += v }
  end

  max = totals.max
  best = []
  totals.each_with_index { |v, i| best << (i + 1) if v == max }
  puts max
  puts best.join(' ')
end
