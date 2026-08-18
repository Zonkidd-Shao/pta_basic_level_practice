# 1122 找奇葩
#
# 题目描述：
#   在一个长度为 n 的正整数序列中，所有的奇数都出现了偶数次，只有一个奇葩奇数出现了奇数次。你的任务就是找出这个奇葩。
#
# 实现原理：
#   在数组中找出唯一出现一次的元素；其他元素都出现两次；使用异或运算或哈希表查找
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  arr = gets.split.map(&:to_i)

  common = if arr[0] == arr[1] || arr[0] == arr[2]
             arr[0]
           else
             arr[1]
           end
  odd = arr.find { |x| x != common }
  puts odd
end
