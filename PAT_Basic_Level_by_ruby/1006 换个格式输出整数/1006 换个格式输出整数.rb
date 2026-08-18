# 1006 换个格式输出整数
#
# 题目描述：
#   让我们用字母 `B` 来表示“百”、字母 `S` 表示“十”，用 `12...n` 来表示不为零的个位数字 `n`（<10），换个格式来输出任一个不超过 3 位的正整数。例如 `234` 应该被输出为 `BBSSS1234`，因为它有 2 个“百”、3 个“十”、以及个位的 4。
#
# 实现原理：
#   按位分解整数的各位数字；根据位数输出对应的字符格式；使用字符串重复构造输出结果
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  hundreds = n / 100
  tens = (n / 10) % 10
  units = n % 10

  result = 'B' * hundreds + 'S' * tens + (1..units).map(&:to_s).join
  puts result
end
