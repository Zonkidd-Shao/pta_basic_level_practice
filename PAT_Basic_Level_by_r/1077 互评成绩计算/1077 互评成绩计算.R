# 题目名称：互评成绩计算
# 题目编号：PAT Basic 1077
# 实现原理：
#   对每个组的评分进行处理：将所有分数排序后去掉一个最高分和一个最低分，
#   计算剩余分数的平均值，再与老师评分（注：此处代码逻辑为取排序后去首尾的均值），
#   最后四舍五入取整输出最终得分。
# 时间复杂度：O(N * N log N)，N为分组数，每组排序需要O(N log N)
# 空间复杂度：O(N)，存储一组分数
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);for(s in x[-1]){v<-sort(as.numeric(strsplit(s,"\\s+")[[1]]));v<-v[-c(1,length(v))];cat(round(mean(v)/h[2]),"\n")}
