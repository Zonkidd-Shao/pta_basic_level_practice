# 题目名称：判断题
# 题目编号：PAT Basic 1061
# 实现原理：
#   读取学生人数N和题目数量M，以及每题的分值和正确答案。
#   对每个学生的答案与正确答案逐一比较，答对的题目累加对应分值，
#   最后输出每个学生的总分。
# 时间复杂度：O(N*M)，其中N为学生人数，M为题目数量
# 空间复杂度：O(N+M)，存储学生得分和答案数组
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);points<-as.integer(strsplit(x[2],"\\s+")[[1]]);ans<-strsplit(x[3],"\\s+")[[1]];for(i in 1:h[1]){v<-strsplit(x[i+3],"\\s+")[[1]];cat(sum(points[as.logical(as.integer(v)==as.integer(ans))]),"\n")}
