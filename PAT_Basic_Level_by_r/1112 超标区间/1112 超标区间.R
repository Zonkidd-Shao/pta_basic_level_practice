# 题目名称：超标区间
# 题目编号：PAT Basic 1112
# 实现原理：
#   找出数据中超出阈值T的连续区间。若有多个超标区间则按格式输出每个区间[A,B]；
#   若没有超标数据，则输出所有数据的最大值。
#   解题思路：1. 遍历数据数组，标记每个位置是否超标（>T）；
#   2. 扫描数组，找出连续超标的区间（即超标段的起点和终点）；
#   3. 若存在超标区间，按格式逐个输出；若不存在，输出数组最大值。
#   关键是用一次遍历找出所有连续超标的区间。
# 时间复杂度：O(N)，一次遍历找超标区间，或一次遍历求最大值
# 空间复杂度：O(N)，存储数据数组
z<-as.numeric(scan("stdin",quiet=TRUE));n<-z[1];t<-z[2];a<-z[3:(n+2)];bad<-a>t;if(!any(bad)){cat(max(a),"\n")}else{st<-which(bad)[c(TRUE,diff(which(bad))>1)];en<-which(bad)[c(diff(which(bad))>1,TRUE)];for(i in seq_along(st))cat("[",st[i]-1,", ",en[i]-1,"]\n",sep="")}
