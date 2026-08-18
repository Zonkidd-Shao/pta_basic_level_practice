# 题目名称：朋友数
# 题目编号：PAT Basic 1064
# 实现原理：
#   朋友数定义为各位数字之和相同的数。对每个整数计算其各位数字之和，
#   将所有和存入集合去重，得到不同的朋友证号，最后排序输出。
#   核心是将每个数的各位数字拆分并求和，利用unique函数去重。
# 时间复杂度：O(N*D)，N为数字个数，D为数字的位数（最多4位）
# 空间复杂度：O(N)，存储朋友证号集合
z<-as.integer(scan("stdin",quiet=TRUE));v<-unique(vapply(z[-1],function(x)sum(as.integer(strsplit(as.character(x),"")[[1]])),integer(1)));cat(length(v),"\n",paste(sort(v),collapse=" "),"\n",sep="")
