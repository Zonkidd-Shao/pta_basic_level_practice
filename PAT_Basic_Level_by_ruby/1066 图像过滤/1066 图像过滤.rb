# 1066 图像过滤
#
# 题目描述：
#   图像过滤是把图像中不重要的像素都染成背景色，使得重要部分被凸显出来。现给定一幅黑白图像，要求你将灰度值位于某指定区间内的所有像素颜色都用一种指定的颜色替换。
#
# 实现原理：
#   遍历图像的每个像素点；将指定范围内的像素值替换为新值；按格式输出处理后的图像数据
#

if __FILE__ == $PROGRAM_NAME
  m, n, a, b, c = gets.split.map(&:to_i)
  (1..m).each do
    row = gets.split.map(&:to_i).map { |v| (v >= a && v <= b) ? c : v }
    puts row.join(' ')
  end
end
