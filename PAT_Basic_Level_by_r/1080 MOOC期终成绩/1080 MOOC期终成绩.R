# 题目名称：MOOC期终成绩
# 题目编号：PAT Basic 1080
# 实现原理：
#   使用哈希表（列表）按学号存储学生的编程作业分、期中成绩、期末成绩。
#   分三部分读取输入，分别更新对应成绩。然后计算总评成绩：
#   若期中成绩>期末成绩，总评 = 期中*40% + 期末*60%；否则总评 = 期末。
#   筛选出编程作业>=200分且期末>=60分的合格学生，
#   按总评成绩降序、学号升序排序后输出。
# 时间复杂度：O(P+M+N + S log S)，S为合格学生数，排序为S log S
# 空间复杂度：O(P+M+N)，存储所有学生成绩
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);d<-list();readpart<-function(st,cnt,key){for(s in x[st:(st+cnt-1)]){p<-strsplit(s,"\\s+")[[1]];if(is.null(d[[p[1]]]))d[[p[1]]]<<-c(-1,-1,-1);d[[p[1]]][key]<<-as.numeric(p[2])}};readpart(2,h[1],1);readpart(2+h[1],h[2],2);readpart(2+h[1]+h[2],h[3],3);a<-do.call(rbind,d);g<-ifelse(a[,2]>a[,3],a[,2],round(.4*a[,2]+.6*a[,3]));ok<-a[,1]>=200&a[,3]>=60;o<-order(-g[ok],names(d)[ok]);for(i in which(ok)[o])cat(names(d)[i],a[i,1],a[i,2],a[i,3],g[i],"\n")
