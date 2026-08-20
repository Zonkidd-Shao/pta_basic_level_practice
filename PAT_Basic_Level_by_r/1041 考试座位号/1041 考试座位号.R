# 题目名称：考试座位号
# 题目编号：PAT Basic 1041
# 实现原理：
#   读取所有考生信息（准考证号、试机座位号、考试座位号）存储在矩阵中，
#   然后对于每个查询的试机座位号，遍历矩阵查找匹配的行，
#   输出对应的准考证号和考试座位号。
#   采用线性查找方式，简单直接，适合 N<=1000 的数据规模。
# 时间复杂度：O(N + M*N)，其中 N 为考生数，M 为查询数
# 空间复杂度：O(N)
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);a<-do.call(rbind,strsplit(x[2:(n+1)],"\\s+"));q<-scan(text=paste(x[(n+2):length(x)],collapse=" "),what="",quiet=TRUE);for(v in q[-1]){r<-a[a[,2]==v,,drop=FALSE];cat(r[1,1],r[1,3],"\n",sep=" ")}
