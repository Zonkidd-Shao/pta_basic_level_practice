# 1099 性感素数
#
# 题目描述：
#   “性感素数”是指形如 (p, p+6) 这样的一对素数。之所以叫这个名字，是因为拉丁语管“六”叫“sex”（即英语的“性感”）。（原文摘自 http://mathworld.wolfram.com/SexyPrimes.html）
#   现给定一个整数，请你判断其是否为一个性感素数。
#
# 实现原理：
#   判断一个数是否为素数；检查该数与相差6的数是否都是素数；输出性感素数对或判断结果
#

# 素数判断
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

# 计算 N 到区间 [c, c+6] 的距离
# @param n [Integer]
# @param c [Integer]
# @return [Integer]
def dist_to_interval(n, c)
  return c - n if n < c
  return n - (c + 6) if n > c + 6

  0
end

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i

  embraced = nil
  (2..n + 6).each do |c|
    if prime?(c) && prime?(c + 6) && c <= n && n <= c + 6
      embraced = [c, c + 6]
      break
    end
  end

  if embraced
    puts "Yes #{embraced[0]} #{embraced[1]}"
  else
    best = nil
    best_dist = Float::INFINITY
    (2..n + 200).each do |c|
      next unless prime?(c) && prime?(c + 6)

      d = dist_to_interval(n, c)
      if d < best_dist
        best_dist = d
        best = [c, c + 6]
      end
    end
    puts "No #{best[0]} #{best[1]}"
  end
end
