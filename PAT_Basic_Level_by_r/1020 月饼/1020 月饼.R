# 题目名称：月饼
# 题目编号：PAT Basic 1020
# 实现原理：
#   经典贪心算法问题：给定 N 种月饼的库存量和总售价，以及市场最大需求量 D，
#   求能获得的最大收益。
#   贪心策略：优先选择单价（总售价/库存量）最高的月饼出售。
#   解题步骤：
#   1. 计算每种月饼的单价
#   2. 按单价从高到低排序
#   3. 依次取货，取完当前种类或满足需求为止，累加收益
#   4. 直到需求量为 0 时停止
# 时间复杂度：O(n log n) - 主要耗时在排序阶段
# 空间复杂度：O(n) - 存储所有月饼的库存、价格和单价信息
x<-readLines("stdin",warn=FALSE);h<-as.numeric(strsplit(x[1],"\\s+")[[1]]); stock<-as.numeric(strsplit(x[2],"\\s+")[[1]]);price<-as.numeric(strsplit(x[3],"\\s+")[[1]]);o<-order(price/stock,decreasing=TRUE);need<-h[2];ans<-0;for(i in o){take<-min(need,stock[i]);ans<-ans+take*price[i]/stock[i];need<-need-take;if(need==0)break};cat(sprintf("%.2f\n",ans))
