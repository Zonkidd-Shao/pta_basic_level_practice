# 题目名称：锤子剪刀布
# 题目编号：PAT Basic 1018
# 实现原理：
#   统计 N 局锤子剪刀布游戏中甲乙双方的胜负平次数，以及各自获胜最多的手势。
#   手势编码：B=1, C=2, J=3。判断胜负的规则：(甲-乙) %% 3 == 1 时甲胜。
#   用数组分别记录甲、乙用每种手势获胜的次数。
#   最后统计总胜、平、负次数，并用 which.max 找出获胜最多的手势（字母序最小的优先）。
# 时间复杂度：O(n) - n 为游戏局数，逐局统计
# 空间复杂度：O(1) - 只使用固定大小的计数数组
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);g<-c(B=1L,C=2L,J=3L); a<-b<-integer(3); win<-function(u,v)(g[u]-g[v])%%3L==1L; for(s in x[-1]){p<-strsplit(s,"\\s+")[[1]];if(win(p[1],p[2]))a[g[p[1]]]<-a[g[p[1]]]+1L else if(win(p[2],p[1]))b[g[p[2]]]<-b[g[p[2]]]+1L}; cat(sum(a),n-sum(a)-sum(b),sum(b),"\n",sum(b),n-sum(a)-sum(b),sum(a),"\n",names(a)[which.max(a)],names(b)[which.max(b)],"\n",sep=" ")
