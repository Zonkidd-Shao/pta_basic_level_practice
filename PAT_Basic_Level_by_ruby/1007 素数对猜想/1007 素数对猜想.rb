# 1007 素数对猜想
#
# 题目描述：
#   让我们定义d_n为：d_n = p_{n+1}-p_n，其中p_i是第i个素数。显然有d_1 = 1，且对于n>1有d_n是偶数。“素数对猜想”认为“存在无穷多对相邻且差为2的素数”。
#   现给定任意正整数`N`(<10^5)，请计算不超过`N`的满足猜想的素数对的个数。
#
# 实现原理：
#   使用筛法或试除法判断素数；遍历范围内所有可能的素数对；统计差值为2的素数对数量
#

# 埃拉托色尼筛法求不超过 n 的所有素数
# @param n [Integer]
# @return [Array<Integer>]
def primes_up_to(n)
  return [] if n < 2

  sieve = Array.new(n + 1, true)
  sieve[0] = sieve[1] = false
  (2..Math.sqrt(n).to_i).each do |i|
    next unless sieve[i]

    (i * i..n).step(i) { |j| sieve[j] = false }
  end
  (2..n).select { |i| sieve[i] }
end

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  primes = primes_up_to(n)

  count = 0
  (0...primes.length - 1).each do |i|
    count += 1 if primes[i + 1] - primes[i] == 2
  end
  puts count
end
