# 1123 舍入
#
# 题目描述：
#   不同的编译器对浮点数的精度有不同的处理方法。常见的一种是“四舍五入”，即考察指定有效位的后一位数字，如果不小于 5，就令有效位最后一位进位，然后舍去后面的尾数；如果小于 5 就直接舍去尾数。另一种叫“截断”，即不管有效位后面是什么数字，一概直接舍去。还有一种是“四舍六入五成双”，即当有效位的后一位数字是 5 时，有 3 种情况要考虑：如果 5 后面还有其它非 0 尾数，则进位；如果没有，则当有效位最后一位是单数时进位，双数时舍去，即保持最后一位是双数。
#   本题就请你写程序按照要求处理给定浮点数的舍入问题。
#
# 实现原理：
#   对数字进行四舍五入处理；保留指定小数位数；处理正数和负数的舍入规则
#

if __FILE__ == $PROGRAM_NAME
  n, decimals = gets.split.map(&:to_i)

  n.times do
    mode, value = gets.split
    negative = value.start_with?('-')
    magnitude = negative ? value[1..] : value
    integer, fraction = magnitude.split('.', 2)
    fraction ||= ''
    kept = fraction[0, decimals].to_s.ljust(decimals, '0')
    discarded = fraction[decimals..].to_s
    increment = false

    if mode.to_i == 1
      increment = discarded.start_with?('5', '6', '7', '8', '9')
    elsif mode.to_i == 3
      first = discarded[0]
      if first && first > '5'
        increment = true
      elsif first == '5'
        increment = discarded[1..].to_s.match?(/[1-9]/) ||
                    (kept.empty? ? integer[-1].to_i.odd? : kept[-1].to_i.odd?)
      end
    end

    combined = (integer + kept).sub(/\A0+(?=\d)/, '')
    if increment
      digits = combined.chars
      index = digits.length - 1
      while index >= 0 && digits[index] == '9'
        digits[index] = '0'
        index -= 1
      end
      if index.negative?
        digits.unshift('1')
      else
        digits[index] = (digits[index].ord + 1).chr
      end
      combined = digits.join
    end

    required_length = integer.length + decimals
    combined = combined.rjust(required_length, '0')
    output_integer = combined[0, integer.length].sub(/\A0+(?=\d)/, '')
    output_fraction = decimals.zero? ? '' : combined[integer.length, decimals]
    output = decimals.zero? ? output_integer : "#{output_integer}.#{output_fraction}"
    output = "-#{output}" if negative && output != '0' && !output.match?(/\A0(?:\.0+)?\z/)
    puts output
  end
end
