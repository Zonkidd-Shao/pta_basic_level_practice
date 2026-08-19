# 1012 数字分类
#
# 题目描述：
#   给定一系列正整数，请按要求对数字进行分类，并输出以下 5 个数字：
#   - A_1 = 能被 5 整除的数字中所有偶数的和；
#   - A_2 = 将被 5 除后余 1 的数字按给出顺序进行交错求和，即计算 n_1-n_2+n_3-n_4\cdots；
#   - A_3 = 被 5 除后余 2 的数字的个数；
#   - A_4 = 被 5 除后余 3 的数字的平均数，精确到小数点后 1 位；
#   - A_5 = 被 5 除后余 4 的数字中最大数字。
#
# 实现原理：
#   按余数对数字进行分类；分别计算各类的统计值（和、个数、平均值等）；按指定格式输出各类结果
#

if __FILE__ == $PROGRAM_NAME
  nums = gets.split.map(&:to_i)
  nums.shift # 丢弃 N（数量），后续直接遍历剩余数字

  a1 = a2 = a3 = a4_sum = a5 = 0
  a2_sign = 1
  a4_count = 0
  exist = [false] * 5

  nums.each do |x|
    case x % 5
    when 0
      if x.even?
        a1 += x
        exist[0] = true
      end
    when 1
      a2 += a2_sign * x
      a2_sign = -a2_sign
      exist[1] = true
    when 2
      a3 += 1
      exist[2] = true
    when 3
      a4_sum += x
      a4_count += 1
      exist[3] = true
    when 4
      a5 = x if x > a5
      exist[4] = true
    end
  end

  out = []
  out << (exist[0] ? a1.to_s : 'N')
  out << (exist[1] ? a2.to_s : 'N')
  out << (exist[2] ? a3.to_s : 'N')
  out << (exist[3] ? format('%.1f', a4_sum.to_f / a4_count) : 'N')
  out << (exist[4] ? a5.to_s : 'N')
  puts out.join(' ')
end
