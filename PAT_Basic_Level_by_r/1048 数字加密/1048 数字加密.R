# 题目名称：数字加密
# 题目编号：PAT Basic 1048
# 实现原理：
#   将输入的两个数字字符串拆分为单个数字，逐位进行加密运算。
#   奇数位（从左往右数，第1位为奇数位）：两位数字相加后对 13 取余，
#     10 用 J 表示、11 用 Q 表示、12 用 K 表示。
#   偶数位：两位数字相加，若和大于等于 10 则减 10，否则保持不变。
#   最后将加密后的数字拼接成字符串输出。
# 时间复杂度：O(n)，n 为数字位数
# 空间复杂度：O(n)
x<-scan("stdin",what="",quiet=TRUE);A<-strsplit(x[1],"",fixed=TRUE)[[1]];B<-strsplit(x[2],"",fixed=TRUE)[[1]];L<-max(length(A),length(B));A<-c(rep("0",L-length(A)),A);B<-c(rep("0",L-length(B)),B);out<-character(L);for(i in L:1){pos<-L-i+1;v<-if(pos%%2==1)(as.integer(A[i])+as.integer(B[i]))%%13 else (as.integer(B[i])-as.integer(A[i]))%%10;out[i]<-c(as.character(0:9),"J","Q","K")[v+1L]};cat(paste0(out,collapse=""),"\n")
