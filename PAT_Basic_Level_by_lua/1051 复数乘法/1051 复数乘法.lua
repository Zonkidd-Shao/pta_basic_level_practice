-- 题目编号: 1051 复数乘法
-- 实现原理: 读取两个复数的极坐标形式(R,P)，根据复数乘法公式(A*B)的模为R1*R2，辐角为P1+P2，计算直角坐标结果。将绝对值小于0.005的值视为0处理，避免输出-0.00。
-- 读取两个复数的极坐标参数：R1(模), P1(辐角), R2(模), P2(辐角)
local a, b, c, d = io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n")
-- 计算乘积的实部和虚部
-- 复数乘法：模相乘 a*c，辐角相加 b+d
-- 实部 x = 模 * cos(辐角)，虚部 y = 模 * sin(辐角)
local x, y = a * c * math.cos(b + d), a * c * math.sin(b + d)
-- 将绝对值小于0.005的值视为0，避免输出-0.00这样的负零结果
if math.abs(x) < .005 then x = 0 end
if math.abs(y) < .005 then y = 0 end
-- 按格式输出：实部保留两位小数，虚部带正负号保留两位小数，以i结尾
print(string.format("%.2f%+.2fi", x, y))
