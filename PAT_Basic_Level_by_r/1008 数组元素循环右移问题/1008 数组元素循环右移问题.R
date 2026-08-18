# 题目名称：数组元素循环右移问题
# 题目编号：PAT Basic 1008
# 实现原理：
#   循环右移 M 位等价于右移 M % N 位（因为移动 N 位等于没移）。
#   将数组分为两部分：后 M 个元素和前 N-M 个元素。
#   利用 tail 和 head 函数分别取出后 M 个和前 N-M 个元素，
#   再将后 M 个元素拼接到前面，前 N-M 个元素拼接到后面，即可得到循环右移结果。
# 时间复杂度：O(n) - 拼接和输出需要遍历整个数组
# 空间复杂度：O(n) - 需要存储整个数组
z <- as.integer(scan("stdin",quiet=TRUE)); n <- z[1]; m <- z[2] %% n; a <- z[3:(n+2)]; cat(paste(c(tail(a,m), head(a,n-m)),collapse=" "),"\n")
