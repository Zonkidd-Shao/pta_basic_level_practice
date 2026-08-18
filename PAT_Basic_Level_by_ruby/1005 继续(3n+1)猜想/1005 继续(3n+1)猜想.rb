# 1005 继续(3n+1)猜想
#
# 题目描述：
#   卡拉兹(Callatz)猜想已经在1001中给出了描述。在这个题目里，情况稍微有些复杂。
#   当我们验证卡拉兹猜想的时候，为了避免重复计算，可以记录下递推过程中遇到的每一个数。例如对 n=3 进行验证的时候，我们需要计算 3、5、8、4、2、1，则当我们对 n=5、8、4、2 进行验证的时候，就可以直接判定卡拉兹猜想的真伪，而不需要重复计算，因为这 4 个数已经在验证3的时候遇到过了，我们称 5、8、4、2 是被 3“覆盖”的数。我们称一个数列中的某个数 n 为“关键数”，如果 n 不能被数列中的其他数字所覆盖。
#   现在给定一系列待验证的数字，我们只需要验证其中的几个关键数，就可以不必再重复验证余下的数字。你的任务就是找出这些关键数字，并按从大到小的顺序输出它们。
#
# 实现原理：
#   模拟卡拉兹猜想的计算过程；对偶数直接除以2，对奇数计算(3n+1)/2；循环迭代直到n等于1，统计步数
#

require 'set'

# 计算 n 在卡拉兹递推过程中覆盖到的所有数（不含 n 本身）
# @param n [Integer]
# @return [Set<Integer>]
def covered_numbers(n)
  covered = Set.new
  cur = n
  while cur > 1
    cur = if cur.even?
            cur / 2
          else
            (3 * cur + 1) / 2
          end
    covered.add(cur)
  end
  covered
end

if __FILE__ == $PROGRAM_NAME
  k = gets.to_i
  nums = gets.split.map(&:to_i)

  covered = Set.new
  nums.each { |x| covered.merge(covered_numbers(x)) }

  key_numbers = nums.reject { |x| covered.include?(x) }.sort.reverse
  puts key_numbers.join(' ')
end
