# 题目名称：人口普查
# 题目编号：PAT Basic 1028
# 实现原理：
#   1. 读取输入数据，包括人数和每个人的姓名、出生日期
#   2. 将出生日期转换为Date类型
#   3. 筛选出出生日期在有效范围内（1814-09-06 到 2014-09-06）的人
#   4. 如果没有有效记录，输出0
#   5. 否则，输出有效人数、最年长的人（出生日期最小）和最年轻的人（出生日期最大）的姓名
# 时间复杂度：O(n)，其中n为人数，需要遍历所有人进行日期比较
# 空间复杂度：O(n)，需要存储所有人的信息
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);a<-do.call(rbind,strsplit(x[2:(n+1)],"\\s+"));d<-as.Date(a[,2]);ok<-d>=as.Date("1814-09-06")&d<=as.Date("2014-09-06");if(!any(ok))cat("0\n")else{a<-a[ok,,drop=FALSE];d<-as.Date(a[,2]);cat(nrow(a),a[which.min(d),1],a[which.max(d),1],"\n",sep=" ")}
