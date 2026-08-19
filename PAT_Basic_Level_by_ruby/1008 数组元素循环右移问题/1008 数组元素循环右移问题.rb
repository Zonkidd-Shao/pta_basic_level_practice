# 1008 数组元素循环右移问题
#
# 题目描述：
#   一个数组A中存有N（>0）个整数，在不允许使用另外数组的前提下，将每个整数循环向右移M（\ge 0）个位置，即将A中的数据由（A_0 A_1 \cdots A_{N-1}）变换为（A_{N-M} \cdots A_{N-1} A_0 A_1 \cdots A_{N-M-1}）（最后M个数循环移至最前面的M个位置）。如果需要考虑程序移动数据的次数尽量少，要如何设计移动的方法？
#
# 实现原理：
#   使用数组切片实现高效的循环位移；取模运算处理位移量大于数组长度的情况；将后M个元素移到数组前面
#

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)
  arr = gets.split.map(&:to_i)

  # M 可能大于等于 N，取模避免无效移位
  m = m % n
  rotated = if m.zero?
              arr
            else
              arr[-m..] + arr[0...-m]
            end
  puts rotated.join(' ')
end
