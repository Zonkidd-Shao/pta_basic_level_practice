# 题目名称：最简分数
# 题目编号：PAT Basic 1062
# 实现原理：
#   给定两个分数和分母K，找出介于两分数之间、分母为K的最简分数。
#   通过遍历可能的分子i，用交叉乘法比较分数大小避免浮点数误差，
#   再用辗转相除法（欧几里得算法）判断i与K是否互质，
#   收集所有符合条件的最简分数并输出。
# 时间复杂度：O(K*log(min(i,K)))，K为分母，辗转相除法为对数级
# 空间复杂度：O(K)，存储结果列表
z<-as.integer(scan("stdin",quiet=TRUE));n1<-z[1];m1<-z[2];n2<-z[3];m2<-z[4];k<-z[5];g<-function(a,b)if(b==0)a else Recall(b,a%%b);out<-character();for(i in (n1%/%m1*k+1):(ceiling(n2/m2*k)-1)){if(i*m1>n1*k&&i*m2<n2*k&&g(i,k)==1)out<-c(out,paste0(i,"/",k))};cat(paste(out,collapse=" "),"\n")
