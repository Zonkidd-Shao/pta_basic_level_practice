# 题目名称：部分A+B
# 题目编号：PAT Basic 1016
# 实现原理：
#   正整数 A 的"DA 部分"定义为由 A 中所有 DA 组成的新整数 PA。
#   解题思路：将 A 作为字符串处理，用正则表达式移除非 DA 的字符，
#   剩余的全是 DA 组成的字符串，转为数值即为 PA。若没有 DA 则 PA 为 0。
#   同理计算 PB，最后输出 PA + PB。
# 时间复杂度：O(n) - n 为数字的位数，正则替换和字符遍历
# 空间复杂度：O(n) - 存储字符串形式的数字
x<-scan("stdin",what="",quiet=TRUE); f<-function(s,d){q<-gsub(paste0("[^",d,"]"),"",s);if(nchar(q)==0)0 else as.numeric(q)};cat(f(x[1],x[2])+f(x[3],x[4]),"\n")
