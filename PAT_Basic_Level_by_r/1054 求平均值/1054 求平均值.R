# 题目名称：求平均值
# 题目编号：PAT Basic 1054
# 实现原理：
#   读取输入的数字字符串，逐个验证是否为合法数字：
#   1. 用正则表达式校验格式：可选正负号，整数部分（一位或多位且不以0开头，除非是单个0），
#      可选小数部分（最多两位小数）
#   2. 验证数值范围：绝对值不超过 1000
#   对非法数字输出错误信息，对合法数字计算平均值。
#   使用 vapply 向量化验证提高效率。
# 时间复杂度：O(n)，n 为输入数字的个数
# 空间复杂度：O(n)
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);a<-scan(text=paste(x[2:length(x)],collapse=" "),what="",quiet=TRUE)[1:n];ok<-vapply(a,function(s)grepl("^[+-]?(1000|[0-9]{1,3})(\\.[0-9]{1,2})?$",s)&&abs(as.numeric(s))<=1000,logical(1));for(s in a[!ok])cat("ERROR: ",s," is not a legal number\n",sep="");v<-as.numeric(a[ok]);if(!length(v))cat("The average of 0 numbers is Undefined\n")else cat(sprintf("The average of %d number%s is %.2f\n",length(v),ifelse(length(v)==1,"","s"),mean(v)))
