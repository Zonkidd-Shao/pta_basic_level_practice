# 1010 一元多项式求导
#
# 题目描述：
#   设计函数求一元多项式的导数。（注：x^n（n为整数）的一阶导数为n x^{n-1}。）
#
# 实现原理：
#   使用数组存储多项式的系数和指数对；按求导规则计算：新系数=原系数*指数，新指数=原指数-1；处理零多项式的特殊输出情况
#

if __FILE__ == $PROGRAM_NAME
  input = gets(chomp: true)
  terms = input.split.map(&:to_i)

  result = []
  terms.each_slice(2) do |coef, exp|
    # 常数项（指数为 0）求导后消失
    next if exp.zero?

    result << coef * exp << exp - 1
  end

  if result.empty?
    puts '0 0'
  else
    puts result.join(' ')
  end
end
