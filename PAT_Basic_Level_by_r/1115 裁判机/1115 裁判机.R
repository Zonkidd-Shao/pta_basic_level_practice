# 题目名称：裁判机
# 题目编号：PAT Basic 1115
# 实现原理：
#   模拟一个数字游戏：初始有两个数，玩家轮流报数，报的数必须是已出现两数之差，
#   且未出现过。报错或重复的玩家出局，最后剩下的为赢家。
#   解题思路：1. 读取初始两个数，存入已出现集合seen；
#   2. 用布尔数组alive标记玩家是否还在游戏中；
#   3. 按轮次模拟：每轮中玩家按顺序报数，检查是否合法（未出现过且是某两数之差）；
#   4. 不合法则标记出局并输出信息，合法则将数加入seen；
#   5. 所有轮次结束后，输出剩余赢家或"No winner."。
#   关键：用集合记录已出现的数，用outer计算所有两数差来判断是否合法。
# 时间复杂度：O(N×M×S²)，N为玩家数，M为轮数，S为已出现数个数，每次检查差用outer
# 空间复杂度：O(N×M + S)，存储玩家报数和已出现数集合
x<-readLines("stdin",warn=FALSE);init<-as.integer(strsplit(x[1],"\\s+")[[1]]);h<-as.integer(strsplit(x[2],"\\s+")[[1]]);a<-do.call(rbind,lapply(x[-c(1,2)],function(s)as.integer(strsplit(s,"\\s+")[[1]])));seen<-init;alive<-rep(TRUE,h[1]);for(r in 1:h[2])for(i in 1:h[1])if(alive[i]){v<-a[i,r];ok<-!(v%in%seen)&&any(abs(outer(seen,seen,"-"))==v);if(!ok){alive[i]<-FALSE;cat(sprintf("Round #%d: %d is out.\n",r,i))}else seen<-c(seen,v)};if(any(alive))cat("Winner(s):",paste(which(alive),collapse=" "),"\n") else cat("No winner.\n")
