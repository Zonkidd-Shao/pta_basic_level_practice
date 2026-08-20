# 题目名称：B是A的多少倍
# 题目编号：PAT Basic 1101
# 实现原理：
#   将数A的最低D位截取下来移到最高位前面得到B，求B是A的多少倍。
#   解题思路：设A有L位，则B = (A %% 10^D) * 10^(L-D) + (A %/% 10^D)，
#   即后D位移到前面，前面的部分移到后面，最后计算B/A并保留两位小数。
# 时间复杂度：O(1)，仅涉及常数次数学运算
# 空间复杂度：O(1)，仅使用常数个变量
z<-scan("stdin",what="",quiet=TRUE);A<-z[1];D<-as.integer(z[2]);L<-nchar(A);B<-paste0(substr(A,L-D+1,L),substr(A,1,L-D));cat(sprintf("%.2f\n",as.numeric(B)/as.numeric(A)))
