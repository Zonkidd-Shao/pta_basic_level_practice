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
x<-readLines("stdin",warn=FALSE);a<-as.integer(strsplit(x[1],"")[[1]]);b<-as.integer(strsplit(x[2],"")[[1]]);out<-integer(length(a));for(i in seq_along(a)){v<-a[i]+b[i];out[i]<-if(i%%2) v%%13 else if(v>=10)v-10 else v};cat(paste0(ifelse(out==10,"J",ifelse(out==11,"Q",ifelse(out==12,"K",out))),collapse=""),"\n")
