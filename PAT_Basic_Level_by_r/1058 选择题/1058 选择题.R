# 题目名称：选择题
# 题目编号：PAT Basic 1058
# 实现原理：
#   1. 读取 N 个学生和 M 道题目
#   2. 存储每道题的满分值和正确选项（排序后便于比较）
#   3. 对每个学生，用正则表达式提取每道题的答案，
#      将答案排序后与正确答案比较，完全一致则得分
#   4. 输出每个学生的总分
#   使用 sort + identical 进行集合相等性判断，
#   用 gregexpr + regmatches 解析括号中的答案。
# 时间复杂度：O(N*M)，每个学生每道题都需要比较
# 空间复杂度：O(N + M)
# 题目输入结构较复杂：按题面逐题计分，并统计每个选项错误次数。
lines<-readLines("stdin",warn=FALSE);nm<-as.integer(strsplit(lines[1],"\\s+")[[1]]);n<-nm[1];m<-nm[2];q<-vector("list",m);for(i in 1:m){p<-strsplit(lines[i+1],"\\s+")[[1]];q[[i]]<-list(score=as.numeric(p[1]),ans=sort(p[5:length(p)]))};scores<-numeric(n);wrong<-integer(5);for(i in 1:n){ans<-regmatches(lines[m+1+i],gregexpr("\\([^)]*\\)",lines[m+1+i]))[[1]];for(j in 1:m){v<-sort(strsplit(gsub("[()]","",ans[j])," ")[[1]]);if(identical(v,q[[j]]$ans))scores[i]<-scores[i]+q[[j]]$score}};cat(paste(scores,collapse="\n"),"\n")
