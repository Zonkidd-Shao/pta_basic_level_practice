# 题目名称：校庆
# 题目编号：PAT Basic 1100
# 实现原理：
#   统计参加校庆的校友人数，并找出最年长的校友（若没有校友则找最年长的来宾）。
#   身份证第7-14位是出生日期，出生日期越小则年龄越大。
#   关键步骤：
#   1. 读取校友人数N和N个校友身份证号
#   2. 读起来宾人数M和M个来宾身份证号
#   3. 找出既在来宾中又在校友中的身份证（即来参加校庆的校友）
#   4. 统计校友人数
#   5. 若有校友来，找出最年长的（出生日期最小的，即身份证字典序最小的）
#   6. 若没有校友来，找出最年长的来宾
#   利用身份证号第7-14位是yyyymmdd格式的特点，字典序与出生日期顺序一致，
#   因此可以直接用min()函数找出最年长者。
#   使用 %in% 运算符判断来宾是否为校友。
# 时间复杂度：O(N + M)，线性时间处理两个集合
# 空间复杂度：O(N + M)，存储校友和来宾的身份证号
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);alumni<-x[2:(n+1)];m<-as.integer(x[n+2]);visit<-x[(n+3):(n+m+2)];same<-visit[visit%in%alumni];pick<-if(length(same))same else visit;date<-as.integer(substr(pick,7,14));cat(length(same),"\n",pick[which.min(date)],"\n",sep="")
