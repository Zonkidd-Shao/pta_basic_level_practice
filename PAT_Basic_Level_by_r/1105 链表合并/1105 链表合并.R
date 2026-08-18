# 题目名称：链表合并
# 题目编号：PAT Basic 1105
# 实现原理：
#   将两个单链表按特定规则合并。较长链表至少是较短链表的两倍，将短链表逆序后，
#   每两个长链表节点后插入一个逆序后的短链表节点。
#   解题思路：1. 用哈希表（列表）存储节点地址到数据和下一个地址的映射；
#   2. 遍历两个链表，分别得到节点地址序列a和b；3. 确定长链表a和短链表b，反转b；
#   4. 按"a1→a2→b_m→a3→a4→b_{m-1}→..."的顺序合并；5. 按格式输出结果链表。
# 时间复杂度：O(N)，N为节点总数，遍历链表和合并都是线性时间
# 空间复杂度：O(N)，存储节点信息和两个链表的地址序列
x<-readLines("stdin",warn=FALSE);h<-strsplit(x[1],"\\s+")[[1]];d<-list();for(s in x[-1]){p<-strsplit(s,"\\s+")[[1]];d[[p[1]]]<-p[2:3]};walk<-function(q){r<-character();while(q!="-1"){r<-c(r,q);q<-d[[q]][2]};r};a<-walk(h[1]);b<-walk(h[2]);if(length(a)<length(b)){t<-a;a<-b;b<-t};b<-rev(b);out<-character();i<-1;j<-1;while(i<=length(a)){out<-c(out,a[i:min(i+1,length(a))]);i<-i+2;if(j<=length(b)){out<-c(out,b[j]);j<-j+1}};for(i in seq_along(out))cat(out[i],d[[out[i]]][1],if(i==length(out))"-1" else out[i+1],"\n")
