# 1011 A+B 和 C
#
# 题目描述：
#   给定区间 [-2^{31}, 2^{31}] 内的 3 个整数 A、B 和 C，请判断 A+B 是否大于 C。
#
# 实现原理：
#   处理可能的大整数运算；比较A+B与C的大小关系；输出比较结果
#

if __FILE__ == $PROGRAM_NAME
  t = gets.to_i
  t.times do |i|
    a, b, c = gets.split.map(&:to_i)
    # 直接比较 A+B 与 C（Ruby 整数无溢出，无需特殊处理边界）
    result = (a + b > c) ? 'true' : 'false'
    # 按题目要求输出带用例编号的结果
    puts "Case ##{i + 1}: #{result}"
  end
end
