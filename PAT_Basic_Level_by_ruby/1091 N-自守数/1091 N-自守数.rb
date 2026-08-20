# 1091 N-自守数
#
# 题目描述：
#   如果某个数 K 的平方乘以 N 以后，结果的末尾几位数等于 K，那么就称这个数为“N-自守数”。例如 3\times 92^2 = 25 392，而 25 392 的末尾两位正好是 92，所以 92 是一个 3-自守数。
#   本题就请你编写程序判断一个给定的数字是否关于某个 N 是 N-自守数。
#
# 实现原理：
#   判断某个数乘以自身后末尾是否包含原数；检查K*N^2的末尾数字与N相同；对每个候选数进行验证
#

if __FILE__ == $PROGRAM_NAME
  data = STDIN.read.split.map(&:to_i)
  k = data.shift
  k.times do |i|
    m = data[i]
    len = m.digits.length
    mod = 10**len
    found = nil
    (1..9).each do |n|
      val = n * m * m
      if val % mod == m
        found = [n, val]
        break
      end
    end
    if found
      puts "#{found[0]} #{found[1]}"
    else
      puts 'No'
    end
  end
end
