# 题目名称：开学寄语
# 题目编号：PAT Basic 1072
# 实现原理：
#   读取需要查缴的物品编号列表，然后遍历每个学生的物品清单，
#   检查是否携带有违禁物品。
#   对于有违禁物品的学生，记录其姓名并输出违禁物品。
#   最后统计有问题的学生总数和被查缴物品总数。
# 时间复杂度：O(N*K + M)，N为学生人数，K为平均每人物品数，M为违禁品种类
# 空间复杂度：O(M + N)，存储违禁品列表和结果
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);keys<-strsplit(x[2],"\\s+")[[1]];badstudents<-character();badcount<-0L;for(s in x[3:(h[1]+2)]){p<-strsplit(s,"\\s+")[[1]];items<-p[-c(1,2)];bad<-items[items%in%keys];if(length(bad)){badstudents<-c(badstudents,p[1]);badcount<-badcount+length(bad);cat(p[1],": ",paste(bad,collapse=" "),"\n",sep="")}};cat(length(badstudents),badcount,"\n",sep=" ")
