# 1098 岩洞施工
#
# 题目描述：
#   要将一条直径至少为 1 个单位的长管道水平送入地形复杂的岩洞中，究竟是否可能？下面的两幅图分别给出了岩洞的剖面图，深蓝色的折线勾勒出岩洞顶部和底部的轮廓。图 1 是有可能的，绿色部分显示直径为 1 的管道可以送入。图 2 就不可能，除非把顶部或底部的突出部分削掉 1 个单位的高度。
#   ![fig.JPG](~/ce4d503a-5692-402b-bbc4-0d4feed5d88b.JPG)
#   本题就请你编写程序，判断给定的岩洞中是否可以施工。
#
# 实现原理：
#   检查岩洞上下边界的最小距离；找出每个位置可通过的最大高度；计算需要削掉的岩石体积
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  top = gets.split.map(&:to_i).first(n)
  bottom = gets.split.map(&:to_i).first(n)
  gap = top.min - bottom.max

  if gap >= 1
    puts "Yes #{gap}"
  else
    puts "No #{1 - gap}"
  end
end
