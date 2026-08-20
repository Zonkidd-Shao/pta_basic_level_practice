# 题目名称：字符统计
# 题目编号：PAT Basic 1042
# 实现原理：
#   将输入字符串转换为小写，拆分为单个字符，
#   筛选出其中的英文字母，用 table 函数统计每个字母出现的频率，
#   找到频率最高的字母（若有并列则取字母序最小的）。
#   利用 R 语言内置的 table 函数高效完成频率统计。
# 时间复杂度：O(n)，n 为字符串长度
# 空间复杂度：O(1)，因为最多只有 26 个英文字母
x<-readLines("stdin",warn=FALSE);a<-tolower(strsplit(x[1],"")[[1]]);a<-a[grepl("[a-z]",a)];t<-table(a);cat(names(t)[which(t==max(t))[1]],max(t),"\n",sep=" ")
