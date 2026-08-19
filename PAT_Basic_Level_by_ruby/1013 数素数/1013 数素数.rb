# 1013 数素数
#
# 题目描述：
#   令 P_i 表示第 i 个素数。现任给两个正整数 M \le N \le 10^4，请输出 P_M 到 P_N 的所有素数。
#
# 实现原理：
#   使用埃拉托斯特尼筛法高效生成素数；按格式输出第M到第N个素数；控制每行输出的素数个数
#

# 判断素数
# @param n [Integer]
# @return [Boolean]
def prime?(n)
  return false if n < 2
  return true if n < 4

  return false if n.even? || n % 3 == 0

  i = 5
  while i * i <= n
    return false if n % i == 0 || n % (i + 2) == 0

    i += 6
  end
  true
end

if __FILE__ == $PROGRAM_NAME
  m, n = gets.split.map(&:to_i)

  primes = []
  candidate = 2
  while primes.length < n
    primes << candidate if prime?(candidate)
    candidate += 1
  end

  selected = primes[m - 1...n]
  selected.each_slice(10) do |slice|
    puts slice.join(' ')
  end
end
