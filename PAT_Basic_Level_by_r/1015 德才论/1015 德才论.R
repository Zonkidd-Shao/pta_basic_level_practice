# 题目名称：德才论
# 题目编号：PAT Basic 1015
# 实现原理：
#   根据德分和才分将考生分为四类并排序：
#   第一类（才德全尽）：德分和才分均 >= H，按总分降序
#   第二类（德胜才）：德分 >= H 但才分 < H，按总分降序
#   第三类：德才分均 < H 但德分 >= 才分，按总分降序
#   第四类：其他达到最低线 L 的考生，按总分降序
#   同类别内总分相同按德分降序，德分相同按准考证号升序。
#   先用最低线 L 过滤，再分类，最后用 order 函数多关键字排序。
# 时间复杂度：O(n log n) - 主要耗时在排序阶段
# 空间复杂度：O(n) - 存储所有考生信息
x<-readLines("stdin",warn=FALSE); h<-as.integer(strsplit(x[1],"\\s+")[[1]]); a<-do.call(rbind,strsplit(x[2:(h[1]+1)],"\\s+")); keep<-as.integer(a[,2])>=h[2]&as.integer(a[,3])>=h[2]; a<-a[keep,,drop=FALSE]; v<-matrix(as.integer(a[,2:3]),ncol=2); cls<-ifelse(v[,1]>=h[3]&v[,2]>=h[3],1,ifelse(v[,1]>=h[3],2,ifelse(v[,1]>=v[,2],3,4))); o<-order(cls,-rowSums(v),-v[,1],a[,1]); cat(nrow(a),"\n"); if(nrow(a))cat(paste(apply(a[o,,drop=FALSE],1,paste,collapse=" "),collapse="\n"),"\n",sep="")
