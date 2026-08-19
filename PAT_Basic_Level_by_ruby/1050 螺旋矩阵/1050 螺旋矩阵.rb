# 1050 螺旋矩阵
#
# 题目描述：
#   本题要求将给定的 N 个正整数按非递增的顺序，填入“螺旋矩阵”。所谓“螺旋矩阵”，是指从左上角第 1 个格子开始，按顺时针螺旋方向填充。要求矩阵的规模为 m 行 n 列，满足条件：m\times n 等于 N；m\ge n；且 m-n 取所有可能值中的最小值。
#
# 实现原理：
#   先确定矩阵的行列数（m*n=N，m>=n）；按顺时针方向螺旋填充数字；使用方向变量控制填充方向和边界
#

if __FILE__ == $PROGRAM_NAME
  n_total = gets.to_i
  arr = gets.split.map(&:to_i).sort.reverse

  # 求较小的列数 n：不超过 sqrt(N) 的最大因子
  cols = Math.sqrt(n_total).to_i
  cols = n_total if cols < 1
  cols -= 1 while cols > 1 && n_total % cols != 0
  rows = n_total / cols

  matrix = Array.new(rows) { Array.new(cols, 0) }
  top = 0
  bottom = rows - 1
  left = 0
  right = cols - 1
  idx = 0

  while top <= bottom && left <= right
    (left..right).each { |c| matrix[top][c] = arr[idx]; idx += 1 }
    top += 1
    break if top > bottom

    (top..bottom).each { |r| matrix[r][right] = arr[idx]; idx += 1 }
    right -= 1
    break if left > right

    right.downto(left) { |c| matrix[bottom][c] = arr[idx]; idx += 1 }
    bottom -= 1
    break if top > bottom

    bottom.downto(top) { |r| matrix[r][left] = arr[idx]; idx += 1 }
    left += 1
  end

  matrix.each { |row| puts row.join(' ') }
end
