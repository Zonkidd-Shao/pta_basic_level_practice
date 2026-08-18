# 1045 快速排序
#
# 题目描述：
#   著名的快速排序算法里有一个经典的划分过程：我们通常采用某种方法取一个元素作为主元，通过交换，把比主元小的元素放到它的左边，比主元大的元素放到它的右边。 给定划分后的 N 个互不相同的正整数的排列，请问有多少个元素可能是划分前选取的主元？
#   例如给定 N = 5, 排列是1、3、2、4、5。则：
#   - 1 的左边没有元素，右边的元素都比它大，所以它可能是主元；
#   - 尽管 3 的左边元素都比它小，但其右边的 2 比它小，所以它不能是主元；
#   - 尽管 2 的右边元素都比它大，但其左边的 3 比它大，所以它不能是主元；
#   - 类似原因，4 和 5 都可能是主元。
#   因此，有 3 个元素可能是主元。
#
# 实现原理：
#   找出所有可能的快速排序主元；主元条件：左边元素都比它小，右边元素都比它大；预处理左右最大值和最小值数组，O(n)判断
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  arr = gets.split.map(&:to_i)

  left_max = Array.new(n, -1)
  right_min = Array.new(n, 10**9 + 1)
  (1...n).each { |i| left_max[i] = [left_max[i - 1], arr[i - 1]].max }
  (n - 2).downto(0) { |i| right_min[i] = [right_min[i + 1], arr[i + 1]].min }

  result = []
  (0...n).each do |i|
    result << arr[i] if arr[i] > left_max[i] && arr[i] < right_min[i]
  end

  puts result.length
  puts result.join(' ')
end
