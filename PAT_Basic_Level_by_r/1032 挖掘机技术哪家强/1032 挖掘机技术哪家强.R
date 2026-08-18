# 题目名称：挖掘机技术哪家强
# 题目编号：PAT Basic 1032
# 实现原理：
#   1. 读取输入：参赛人数N，以及每位参赛者的学校编号和成绩
#   2. 使用tapply函数按学校编号分组，对每组的成绩求和
#   3. 找出总分最高的学校及其总分
#   4. 输出结果
# 时间复杂度：O(n)，其中n为参赛人数，需要遍历所有参赛者成绩
# 空间复杂度：O(m)，其中m为学校数量，需要存储每个学校的总分
x<-readLines("stdin",warn=FALSE)[-1];p<-do.call(rbind,strsplit(x,"\\s+"));s<-tapply(as.integer(p[,2]),p[,1],sum);cat(names(s)[which.max(s)],max(s),"\n")
