# 题目名称：插入与归并
# 题目编号：PAT Basic 1035
# 实现原理：
#   1. 读取输入：数列长度n、原始序列、中间序列
#   2. 判断是插入排序还是归并排序：
#      - 找到中间序列中第一个非递增的位置i
#      - 如果i之后的元素与原始序列完全相同，则是插入排序
#      - 否则是归并排序
#   3. 插入排序的下一步迭代：
#      - 将第i+1个元素向前插入到已排序部分的正确位置
#   4. 归并排序的下一步迭代：
#      - 从k=1开始，每次翻倍，模拟归并排序的过程
#      - 找到当前归并段大小k，使得排序结果与中间序列匹配
#      - 然后再进行一轮归并（k翻倍）
#   5. 输出排序类型和下一步迭代的结果
# 时间复杂度：O(n log n)，归并排序模拟需要O(n log n)时间
# 空间复杂度：O(n)，需要额外数组存储排序结果
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);a<-as.integer(strsplit(x[2],"\\s+")[[1]]);b<-as.integer(strsplit(x[3],"\\s+")[[1]]);i<-1L;while(i<n&&b[i]<=b[i+1])i<-i+1L;is_insert<-i==n||all(b[(i+1):n]==a[(i+1):n]);if(is_insert){cat("Insertion Sort\n");if(i<n){j<-i+1L;while(j>1&&b[j]<b[j-1]){t<-b[j];b[j]<-b[j-1];b[j-1]<-t;j<-j-1L}}}else{cat("Merge Sort\n");k<-1L;repeat{k<-k*2L;c<-unlist(lapply(seq(1,n,by=k),function(j)sort(a[j:min(n,j+k-1L)])));if(identical(c,b))break};b<-unlist(lapply(seq(1,n,by=k*2L),function(j)sort(a[j:min(n,j+k*2L-1L)])))};cat(paste(b,collapse=" "),"\n")
