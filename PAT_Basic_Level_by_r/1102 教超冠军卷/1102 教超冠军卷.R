# 题目名称：教超冠军卷
# 题目编号：PAT Basic 1102
# 实现原理：
#   找出销量冠军和销售额冠军。读取N份试卷的信息，每份包含ID、单价、购买人次。
#   解题思路：1. 读取所有试卷数据并解析；2. 计算每份试卷的销售额 = 单价 × 购买人次；
#   3. 找出购买人次最大的试卷（销量冠军）；4. 找出销售额最大的试卷（销售额冠军）；
#   5. 按格式输出结果，销售额用format避免科学计数法。
# 时间复杂度：O(N)，遍历N条数据找出最大值
# 空间复杂度：O(N)，存储N条试卷数据
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);p<-do.call(rbind,strsplit(x[2:(n+1)],"\\s+"));sales<-as.numeric(p[,2])*as.numeric(p[,3]);i<-which.max(as.numeric(p[,3]));j<-which.max(sales);cat(p[i,1],p[i,3],"\n",sep=" ");cat(p[j,1],format(sales[j],scientific=FALSE,trim=TRUE),"\n",sep="")
