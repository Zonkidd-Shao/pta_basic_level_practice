# 1097 矩阵行平移
#
# 题目描述：
#   给定一个 n\times n 的整数矩阵。对任一给定的正整数 k<n，我们将矩阵的奇数行的元素整体向右依次平移 1、……、k、1、……、k、…… 个位置，平移空出的位置用整数 x 补。你需要计算出结果矩阵的每一列元素的和。
#
# 实现原理：
#   对矩阵的奇数行进行循环右移；不同行移动不同的位数；计算各列的和并找出最大值
#

if __FILE__ == $PROGRAM_NAME
  n, m, k = gets.split.map(&:to_i)
  matrix = []
  n.times { matrix << gets.split.map(&:to_i) }

  matrix.each_with_index do |row, idx|
    shift = ((idx + 1) * k) % m
    shifted = shift.zero? ? row : row[-shift..] + row[0...-shift]
    puts shifted.join(' ')
  end
end
