# 1104 天长地久
#
# 题目描述：
#   “天长地久数”是指一个 K 位正整数 A，其满足条件为：A 的各位数字之和为 m，A+1 的各位数字之和为 n，且 m 与 n 的最大公约数是一个大于 2 的素数。本题就请你找出这些天长地久数。
#
# 实现原理：
#   寻找满足各位数字和为A且是K倍数的数；数字按位递增，满足约束条件；枚举或数学推导寻找符合条件的数
#

if __FILE__ == $PROGRAM_NAME
  def gcd_int(a, b)
    a, b = b, a % b while b != 0
    a
  end

  def prime_gt_two?(value)
    return false if value <= 2

    (2..Math.sqrt(value).to_i).none? { |d| (value % d).zero? }
  end

  query_count = gets.to_i
  query_count.times do |case_index|
    k, m = gets.split.map(&:to_i)
    results = []

    (1...k).each do |trailing_nines|
      prefix_length = k - trailing_nines
      target_sum = m - 9 * trailing_nines
      next if target_sum < 1 || target_sum > 9 * prefix_length

      digits = Array.new(prefix_length, 0)
      build = nil
      build = lambda do |position, remaining|
        if position == prefix_length
          next unless remaining.zero?

          n_sum = m - 9 * trailing_nines + 1
          number = (digits.join + ('9' * trailing_nines)).to_i
          results << [n_sum, number] if prime_gt_two?(gcd_int(m, n_sum))
          next
        end

        minimum = position.zero? ? 1 : 0
        maximum = position == prefix_length - 1 ? 8 : 9
        (minimum..maximum).each do |digit|
          rest = prefix_length - position - 1
          next if remaining < digit || remaining - digit > 9 * rest

          digits[position] = digit
          build.call(position + 1, remaining - digit)
        end
      end
      build.call(0, target_sum)
    end

    puts "Case #{case_index + 1}"
    if results.empty?
      puts 'No Solution'
    else
      results.sort.each { |n_sum, number| puts "#{n_sum} #{number}" }
    end
  end
end
