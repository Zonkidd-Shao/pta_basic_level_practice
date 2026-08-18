# 题目名称：链表元素分类
# 题目编号：PAT Basic 1075
# 实现原理：
#   先用哈希表（列表）存储所有节点信息，然后从首节点开始遍历链表，
#   按顺序收集所有节点ID。接着将节点按值分为三类：
#   小于0的负数、0到K之间的数、大于K的数。
#   每类内部保持原链表的相对顺序。
#   最后按分类后的顺序重新连接链表并输出。
# 时间复杂度：O(N)，N为节点数，遍历链表和分类各一次
# 空间复杂度：O(N)，存储所有节点
x<-readLines("stdin",warn=FALSE);h<-strsplit(x[1],"\\s+")[[1]];head<-h[1];k<-as.integer(h[3]);d<-list();for(s in x[-1]){p<-strsplit(s,"\\s+")[[1]];d[[p[1]]]<-p[2:3]};ids<-character();q<-head;while(q!="-1"){ids<-c(ids,q);q<-d[[q]][2]};ids<-c(ids[as.integer(vapply(ids,function(i)d[[i]][1],""))<0],ids[as.integer(vapply(ids,function(i)d[[i]][1],""))<=k&as.integer(vapply(ids,function(i)d[[i]][1],""))>=0],ids[as.integer(vapply(ids,function(i)d[[i]][1],""))>k]);for(i in seq_along(ids))cat(ids[i],d[[ids[i]]][1],if(i==length(ids))"-1" else ids[i+1],"\n")
