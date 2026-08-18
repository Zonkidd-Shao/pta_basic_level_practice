# 题目名称：组个最小数
# 题目编号：PAT Basic 1023
# 实现原理：
#   1. 读取0-9每个数字的个数
#   2. 为了组成最小的数且首位不能为0：
#      - 先找出最小的非零数字作为首位
#      - 将该数字的个数减1
#   3. 然后从0到9依次输出剩余的所有数字
#   4. 这样保证了高位尽可能小，从而得到最小的数
# 时间复杂度：O(n)，其中n为数字总个数，需要输出每个数字
# 空间复杂度：O(n)，需要存储组成的最小数的各位数字
a<-as.integer(scan("stdin",quiet=TRUE));out<-character();if(a[1]>0){out<-c("1");a[1]<-a[1]-1L};for(i in 1:9)out<-c(out,rep(as.character(i-1L),a[i]));cat(paste(out,collapse=""),"\n")
