# 题目名称：图像过滤
# 题目编号：PAT Basic 1066
# 实现原理：
#   将灰度值在指定区间[A,B]内的像素替换为指定颜色。
#   先读取图像矩阵，然后利用布尔索引批量替换符合条件的像素值，
#   最后按格式输出，每个像素值占3位，不足补零。
# 时间复杂度：O(M*N)，M为行数，N为列数
# 空间复杂度：O(M*N)，存储图像矩阵
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);a<-matrix(as.integer(unlist(strsplit(paste(x[-1],collapse=" "),"\\s+"))),nrow=h[1],byrow=TRUE);a[a>=h[3]&a<=h[4]]<-h[5];for(i in 1:nrow(a))cat(paste(sprintf("%03d",a[i,]),collapse=" "),"\n")
