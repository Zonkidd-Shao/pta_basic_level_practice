# 1024 科学计数法
#
# 题目描述：
#   科学计数法是科学家用来表示很大或很小的数字的一种方便的方法，其满足正则表达式 [+-][1-9]`.`[0-9]+E[+-][0-9]+，即数字的整数部分只有 1 位，小数部分至少有 1 位，该数字及其指数部分的正负号即使对正数也必定明确给出。
#   现以科学计数法的格式给出实数 A，请编写程序按普通数字表示法输出 A，并保证所有有效位都被保留。
#
# 实现原理：
#   解析科学计数法字符串的各部分；根据指数移动小数点位置；输出普通表示形式的数字
#

if __FILE__ == $PROGRAM_NAME
  s = gets(chomp: true)
  negative = s[0] == '-'
  int_digit = s[1]
  frac, exp_part = s[3..].split('E')
  exp = exp_part[1..].to_i
  exp_negative = exp_part[0] == '-'

  digits = int_digit + frac

  if exp_negative
    result = '0.' + '0' * (exp - 1) + digits
  elsif exp >= frac.length
    result = digits + '0' * (exp - frac.length)
  else
    result = digits[0..exp] + '.' + digits[exp + 1..]
  end

  result = (negative ? '-' : '') + result
  puts result
end
