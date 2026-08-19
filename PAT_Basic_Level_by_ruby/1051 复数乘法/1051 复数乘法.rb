# 1051 复数乘法
#
# 题目描述：
#   复数可以写成 (A + Bi) 的常规形式，其中 A 是实部，B 是虚部，i 是虚数单位，满足 i^2 = -1；也可以写成极坐标下的指数形式 (R\times e^{(Pi)})，其中 R 是复数模，P 是辐角，i 是虚数单位，其等价于三角形式 R(\cos (P) + i \sin (P))。
#   现给定两个复数的 R 和 P，要求输出两数乘积的常规形式。
#
# 实现原理：
#   实现复数的乘法运算；使用极坐标形式：模相乘，幅角相加；结果转换为常规形式A+Bi
#

if __FILE__ == $PROGRAM_NAME
  r1, p1, r2, p2 = gets.split.map(&:to_f)
  r = r1 * r2
  p = p1 + p2
  real = r * Math.cos(p)
  imag = r * Math.sin(p)
  real = 0.0 if real.abs < 0.005
  imag = 0.0 if imag.abs < 0.005

  printf "%.2f%+.2fi\n", real, imag
end
