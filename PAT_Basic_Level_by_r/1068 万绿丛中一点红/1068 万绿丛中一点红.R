# 题目名称：万绿丛中一点红
# 题目编号：PAT Basic 1068
# 实现原理：
#   遍历图像中每个像素点，检查两个条件：
#   1. 该像素颜色在整幅图像中唯一出现；
#   2. 该像素与周围8个相邻像素的颜色差都大于阈值TOL。
#   收集所有符合条件的像素，根据数量输出结果：
#   0个输出Not Exist，多个输出Not Unique，1个输出坐标和颜色。
# 时间复杂度：O(M*N)，M为列数，N为行数，每个像素检查其3x3邻域
# 空间复杂度：O(M*N)，存储图像矩阵
z<-as.integer(scan("stdin",quiet=TRUE));m<-z[1];n<-z[2];tol<-z[3];a<-matrix(z[-(1:3)],nrow=m,byrow=TRUE);uniquev<-function(v)sum(a==v)==1;ans<-list();for(i in 1:m)for(j in 1:n){v<-a[i,j];nb<-a[max(1,i-1):min(m,i+1),max(1,j-1):min(n,j+1)];if(uniquev(v)&&all(abs(nb-v)>tol|nb==v))ans[[length(ans)+1]]<-c(i,j,v)};if(!length(ans))cat("Not Exist\n") else if(length(ans)>1)cat("Not Unique\n") else cat(sprintf("(%d, %d): %d\n",ans[[1]][2],ans[[1]][1],ans[[1]][3]))
