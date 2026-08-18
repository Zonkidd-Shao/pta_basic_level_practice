# 题目名称：住房空置率
# 题目编号：PAT Basic 1053
# 实现原理：
#   逐户统计住房空置情况：
#   1. 统计每户用电量低于阈值 e 的天数
#   2. 若低于阈值的天数超过观察期的一半，则为"可能空置"
#   3. 若同时观察期超过阈值 D 天，则为"空置"
#   最后分别计算可能空置率和空置率的百分比并输出。
#   使用向量化比较 sum(v[-1]<h[1]) 高效统计低电量天数。
# 时间复杂度：O(N*K)，N 为住户数，K 为平均观察天数
# 空间复杂度：O(1)，只用几个计数变量
x<-readLines("stdin",warn=FALSE);h<-as.numeric(strsplit(x[1],"\\s+")[[1]]);maybe<-0;empty<-0;for(s in x[-1]){v<-as.numeric(strsplit(s,"\\s+")[[1]]);if(sum(v[-1]<h[1])>v[1]/2){if(v[1]>h[2])empty<-empty+1 else maybe<-maybe+1}};cat(sprintf("%.1f%% %.1f%%\n",100*maybe/h[3],100*empty/h[3]))
