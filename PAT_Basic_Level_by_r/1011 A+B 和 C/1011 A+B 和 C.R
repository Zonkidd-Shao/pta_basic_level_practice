# 题目名称：A+B 和 C
# 题目编号：PAT Basic 1011
# 实现原理：
#   给定 T 组测试用例，每组包含三个整数 A、B、C，判断 A+B 是否大于 C。
#   由于数值范围在 [-2^31, 2^31] 内，使用 double 类型读取以避免整数溢出问题。
#   将数据读入矩阵，按行处理每组数据，使用 sprintf 格式化输出结果。
# 时间复杂度：O(T) - T 为测试用例个数，每组只需一次加法和比较
# 空间复杂度：O(T) - 存储所有测试用例数据
z <- scan("stdin",what=double(),quiet=TRUE); n <- z[1]; v <- matrix(z[-1],ncol=3,byrow=TRUE); cat(paste(sprintf("Case #%d: %s",seq_len(n),ifelse(v[,1]+v[,2]>v[,3],"true","false")),collapse="\n"),"\n")
