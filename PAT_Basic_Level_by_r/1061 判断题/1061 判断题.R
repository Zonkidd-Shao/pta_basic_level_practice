# 题目名称：判断题
# 题目编号：PAT Basic 1061
# 实现原理：
#   读取学生人数N和题目数量M，以及每题的分值和正确答案。
#   对每个学生的答案与正确答案逐一比较，答对的题目累加对应分值，
#   最后输出每个学生的总分。
# 时间复杂度：O(N*M)，其中N为学生人数，M为题目数量
# 空间复杂度：O(N+M)，存储学生得分和答案数组
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);ans<-strsplit(x[2],"\\s+")[[1]];score<-numeric(h[1]);for(i in seq_len(h[1])){p<-strsplit(x[i+2],"\\s+")[[1]];v<-p[2:(h[2]+1)];score[i]<-sum((v==ans)*as.numeric(p[1]))};cat(paste(score,collapse="\n"),"\n")
