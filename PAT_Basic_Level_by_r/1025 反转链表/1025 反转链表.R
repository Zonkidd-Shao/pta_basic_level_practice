# 题目名称：反转链表
# 题目编号：PAT Basic 1025
# 实现原理：
#   1. 读取输入数据，包括首结点地址、结点总数N、反转间隔K
#   2. 使用列表（字典）存储所有结点，以地址为键，值为[数据, 下一个地址]
#   3. 从首结点开始遍历链表，按顺序将结点地址存入数组ids
#   4. 对ids数组进行分段反转：每K个结点为一段，段内反转
#   5. 最后不足K个结点的部分保持原顺序
#   6. 按反转后的顺序输出每个结点的地址、数据和下一个结点地址
# 时间复杂度：O(N)，需要遍历链表一次，分段反转也是线性时间
# 空间复杂度：O(N)，需要存储所有结点和ids数组
x<-readLines("stdin",warn=FALSE);h<-strsplit(x[1],"\\s+")[[1]];head<-h[1];k<-as.integer(h[3]);d<-list();for(s in x[-1]){p<-strsplit(s,"\\s+")[[1]];d[[p[1]]]<-p[2:3]}; ids<-character();q<-head;while(q!="-1"){ids<-c(ids,q);q<-d[[q]][2]};for(st in seq(1,length(ids)-k+1,by=k))ids[st:(st+k-1)]<-rev(ids[st:(st+k-1)]);for(i in seq_along(ids)){node<-d[[ids[i]]];cat(ids[i],node[1],if(i==length(ids))"-1" else ids[i+1],"\n")}
