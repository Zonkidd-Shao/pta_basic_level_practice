# 1063 计算谱半径
#
# 题目描述：
#   在数学中，矩阵的“谱半径”是指其特征值的模集合的上确界。换言之，对于给定的 n 个复数空间的特征值 { a_1+b_1i, \cdots , a_n+b_ni }，它们的模为实部与虚部的平方和的开方，而“谱半径”就是最大模。
#   现在给定一些复数空间的特征值，请你计算并输出这些特征值的谱半径。
#
# 实现原理：
#   计算每个特征值的模（实部平方+虚部平方的平方根）；找出最大的模作为谱半径；输出保留两位小数的结果
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  max_mod = 0.0
  n.times do
    r, i = gets.split.map(&:to_i)
    mod = Math.sqrt(r * r + i * i)
    max_mod = mod if mod > max_mod
  end
  printf "%.2f\n", max_mod
end
