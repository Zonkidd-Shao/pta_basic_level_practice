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
z<-as.integer(scan("stdin",quiet=TRUE));N<-z[1];a<-sort(z[-1],decreasing=TRUE);cols<-1L;for(j in 1:floor(sqrt(N)))if(N%%j==0)cols<-j;rows<-N%/%cols;q<-matrix(0L,rows,cols);top<-1L;bot<-rows;left<-1L;right<-cols;k<-1L;while(k<=N){if(left<=right){for(j in left:right){q[top,j]<-a[k];k<-k+1L};top<-top+1L};if(top<=bot){for(i in top:bot){q[i,right]<-a[k];k<-k+1L};right<-right-1L};if(top<=bot&&left<=right){for(j in right:left){q[bot,j]<-a[k];k<-k+1L};bot<-bot-1L};if(left<=right&&top<=bot){for(i in bot:top){q[i,left]<-a[k];k<-k+1L};left<-left+1L}};for(i in 1:rows)cat(paste(q[i,],collapse=" "),"\n")
