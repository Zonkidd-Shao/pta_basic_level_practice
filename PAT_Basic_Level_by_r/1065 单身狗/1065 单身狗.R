# 题目名称：单身狗
# 题目编号：PAT Basic 1065
# 实现原理：
#   用哈希表（命名向量）存储每个人的伴侣ID，形成双向映射。
#   遍历参加派对的客人，检查其是否有伴侣、伴侣是否也在场。
#   没有伴侣或伴侣不在场的即为单身狗，最后按ID排序输出。
# 时间复杂度：O(N+M)，N为伴侣对数，M为参加派对人数
# 空间复杂度：O(N)，存储伴侣映射关系
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);p<-do.call(rbind,strsplit(x[2:(n+1)],"\\s+"));mate<-setNames(c(p[,2],p[,1]),c(p[,1],p[,2]));q<-strsplit(x[n+3],"\\s+")[[1]];out<-sort(q[is.na(mate[q])|!(mate[q]%in%q)]);cat(length(out),"\n",paste(out,collapse=" "),if(length(out))"\n" else "",sep="")
