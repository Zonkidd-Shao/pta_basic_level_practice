# 题目名称：数零壹
# 题目编号：PAT Basic 1057
# 实现原理：
#   将输入字符串拆分为单个字符，
#   统计其中字符 '0' 的个数作为零的个数，
#   总长度减去零的个数得到壹的个数。
#   使用向量化比较 sum(s=="0") 高效统计。
# 时间复杂度：O(n)，n 为字符串长度
# 空间复杂度：O(n)
x<-readLines("stdin",warn=FALSE)[1];s<-tolower(strsplit(x,"")[[1]]);v<-match(s,letters);v<-v[!is.na(v)];if(!length(v))cat("0 0\n")else{n<-sum(v);bits<-integer();while(n>0){bits<-c(n%%2L,bits);n<-n%/%2L};cat(sum(bits==0),sum(bits==1),"\n")}
