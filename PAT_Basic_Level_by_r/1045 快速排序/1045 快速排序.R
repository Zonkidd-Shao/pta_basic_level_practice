# 题目名称：快速排序
# 题目编号：PAT Basic 1045
# 实现原理：
#   快速排序主元的定义：左边所有元素都比它小，右边所有元素都比它大。
#   算法思路：
#   1. 从左到右计算前缀最大值数组 pre，pre[i] 表示 a[0..i] 的最大值
#   2. 从右到左计算后缀最小值数组 suf，suf[i] 表示 a[i..n-1] 的最小值
#   3. 若 a[i] == pre[i] 且 a[i] == suf[i]，则 a[i] 可能是主元
#   利用 cummax 和 cummin 函数高效计算前缀后缀数组。
# 时间复杂度：O(N)，三次线性遍历
# 空间复杂度：O(N)，需要两个辅助数组
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);a<-as.integer(strsplit(x[2],"\\s+")[[1]]);pre<-cummax(a);suf<-rev(cummin(rev(a)));cat(sum(a==pre&a==suf),"\n",paste(a[a==pre&a==suf],collapse=" "),"\n",sep="")
