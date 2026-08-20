# 题目名称：A除以B
# 题目编号：PAT Basic 1017
# 实现原理：
#   本题要求计算 A/B，其中 A 是不超过 1000 位的正整数，B 是 1 位正整数。
#   由于 A 可能非常大，理论上需要用字符串模拟手工除法的过程：
#   从高位到低位逐位除以除数，保留余数参与下一位运算。
#   当前代码直接使用浮点数除法（注：对于 1000 位的大数，浮点数精度可能不足）。
# 时间复杂度：O(n) - n 为 A 的位数，逐位处理
# 空间复杂度：O(n) - 存储大数和结果
z<-scan("stdin",what="",quiet=TRUE); A<-z[1]; B<-as.integer(z[2]); rem<-0L; q<-character(); for(ch in strsplit(A,"")[[1]]){cur<-rem*10L+as.integer(ch); q<-c(q,as.character(cur%/%B)); rem<-cur%%B}; qs<-sub("^0+","",paste0(q,collapse="")); if(!nzchar(qs))qs<-"0"; cat(qs,rem,"\n",sep=" ")
