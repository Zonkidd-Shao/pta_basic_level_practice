# 题目名称：C语言竞赛
# 题目编号：PAT Basic 1059
# 实现原理：
#   1. 读取参赛者排名，用命名向量建立 ID 到排名的映射（O(1) 查找）
#   2. 对每个查询的 ID：
#      - 不在排名中：输出 "Are you kidding?"
#      - 排名第 1：输出 "Mystery Award"（神秘大奖）
#      - 排名为奇数：输出 "Minion"（小黄人）
#      - 其他：输出 "Chocolate"（巧克力）
#   使用 setNames 创建命名向量实现快速查找。
# 时间复杂度：O(N + K)，N 为参赛者数，K 为查询数
# 空间复杂度：O(N)
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);rank<-setNames(seq_len(n),x[2:(n+1)]);for(id in x[(n+3):length(x)]){r<-rank[id];cat(id,if(is.na(r))": Are you kidding?" else if(r==1)": Mystery Award" else if(r%%2)": Minion" else ": Chocolate", "\n",sep="")}
