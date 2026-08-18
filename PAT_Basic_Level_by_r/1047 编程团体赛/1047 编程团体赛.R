# 题目名称：编程团体赛
# 题目编号：PAT Basic 1047
# 实现原理：
#   读取所有队员的比赛成绩，从队伍编号-队员编号中提取队伍编号，
#   使用 tapply 函数按队伍编号分组，对各组的成绩求和，
#   最后找到总成绩最高的队伍及其分数。
#   利用 R 语言的 tapply 函数高效实现分组聚合。
# 时间复杂度：O(N)，N 为队员总数
# 空间复杂度：O(N)
x<-readLines("stdin",warn=FALSE)[-1];p<-do.call(rbind,strsplit(x,"\\s+"));z<-tapply(as.integer(p[,2]),sub("-.*","",p[,1]),sum);cat(names(z)[which.max(z)],max(z),"\n")
