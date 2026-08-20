# 题目名称：最简分数
# 题目编号：PAT Basic 1062
# 实现原理：
#   给定两个分数和分母K，找出介于两分数之间、分母为K的最简分数。
#   通过遍历可能的分子i，用交叉乘法比较分数大小避免浮点数误差，
#   再用辗转相除法（欧几里得算法）判断i与K是否互质，
#   收集所有符合条件的最简分数并输出。
# 时间复杂度：O(K*log(min(i,K)))，K为分母，辗转相除法为对数级
# 空间复杂度：O(K)，存储结果列表
z<-scan("stdin",what="",quiet=TRUE);p<-function(s)as.integer(strsplit(s,"/")[[1]]);a<-p(z[1]);b<-p(z[2]);k<-as.integer(z[3]);if(a[1]*b[2]<=b[1]*a[2]){ln<-a[1];ld<-a[2];hn<-b[1];hd<-b[2]}else{ln<-b[1];ld<-b[2];hn<-a[1];hd<-a[2]};g<-function(x,y){while(y){t<-x%%y;x<-y;y<-t};x};out<-character();for(i in 1:k)if(i*ld>ln*k&&i*hd<hn*k&&g(i,k)==1)out<-c(out,paste0(i,"/",k));cat(paste(out,collapse=" "),"\n")
