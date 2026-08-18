# 1027 打印沙漏
#
# 题目描述：
#
# 实现原理：
#   先计算最大沙漏需要的符号数和行数；分上下两部分打印沙漏图案；控制每行的空格数和符号数
#

if __FILE__ == $PROGRAM_NAME
  total, sym = gets.split
  total = total.to_i

  # 沙漏用掉的符号数 = 2*k^2 - 1（k 为半边行数），求最大 k
  k = 1
  k += 1 while 2 * (k + 1) * (k + 1) - 1 <= total
  used = 2 * k * k - 1

  # 上半部分（k 行）：符号数 2k-1, 2k-3, ..., 1
  (1..k).each do |i|
    spaces = i - 1
    stars = 2 * (k - i + 1) - 1
    puts ' ' * spaces + sym * stars
  end
  # 下半部分（k-1 行）：符号数 3, 5, ..., 2k-1
  (2..k).each do |i|
    spaces = k - i
    stars = 2 * i - 1
    puts ' ' * spaces + sym * stars
  end

  puts total - used
end
