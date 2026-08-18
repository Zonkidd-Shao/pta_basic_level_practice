# 题目名称：螺旋矩阵
# 题目编号：PAT Basic 1050
# 实现原理：
#   采用模拟法填充螺旋矩阵：
#   1. 初始化矩阵为 0，设置上下左右四个边界指针
#   2. 按顺时针方向循环填充：从左到右填充顶部行，从上到下填充右列，
#      从右到左填充底部行，从下到上填充左列
#   3. 每填充完一边后收缩对应的边界
#   4. 重复直到所有数字填充完毕
#   最后按行输出矩阵。
# 时间复杂度：O(m*n)，即 O(N)，每个元素填充一次
# 空间复杂度：O(m*n)，存储螺旋矩阵
z<-as.integer(scan("stdin",quiet=TRUE));n<-z[1];m<-z[2];a<-z[-c(1,2)];q<-matrix(0L,n,m);top<-1;bot<-n;l<-1;r<-m;k<-1;while(k<=length(a)){for(j in l:r){if(k<=length(a)){q[top,j]<-a[k];k<-k+1}};top<-top+1;for(i in top:bot){if(k<=length(a)){q[i,r]<-a[k];k<-k+1}};r<-r-1;for(j in r:l){if(k<=length(a)){q[bot,j]<-a[k];k<-k+1}};bot<-bot-1;for(i in bot:top){if(k<=length(a)){q[i,l]<-a[k];k<-k+1}};l<-l+1};for(i in 1:n)cat(paste(q[i,],collapse=" "),"\n")
