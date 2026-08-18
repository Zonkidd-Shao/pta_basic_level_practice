# 1030 完美数列
#
# 题目描述：
#   给定一个正整数数列，和正整数 p，设这个数列中的最大值是 M，最小值是 m，如果 M \le mp，则称这个数列是完美数列。
#   现在给定参数 p 和一些正整数，请你从中选择尽可能多的数构成一个完美数列。
#
# 实现原理：
#   先对数组进行排序；使用滑动窗口或双指针法寻找最长子序列；满足条件：最大值 <= 最小值 * p
#

if __FILE__ == $PROGRAM_NAME
  n, p = gets.split.map(&:to_i)
  arr = gets.split.map(&:to_i).sort

  max_count = 0
  j = 0
  (0...n).each do |i|
    # 由于数组有序，j 随 i 增大单调右移即可
    while j < n && arr[j] <= arr[i] * p
      j += 1
    end
    count = j - i
    max_count = count if count > max_count
  end

  puts max_count
end
