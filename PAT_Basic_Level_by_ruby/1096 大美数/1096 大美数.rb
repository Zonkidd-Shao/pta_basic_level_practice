# 1096 大美数
#
# 题目描述：
#   若正整数 N 可以整除它的 4 个不同正因数之和，则称这样的正整数为“大美数”。本题就要求你判断任一给定的正整数是否是“大美数”。
#
# 实现原理：
#   找出所有能整除该数的因子；判断是否存在4个因子之和等于该数本身；枚举因子组合验证条件
#

if __FILE__ == $PROGRAM_NAME
  k = gets.to_i
  k.times do
    n = gets.to_i
    is_power_of_two = n.positive? && (n & (n - 1)) == 0
    puts(is_power_of_two ? 'No' : 'Yes')
  end
end
