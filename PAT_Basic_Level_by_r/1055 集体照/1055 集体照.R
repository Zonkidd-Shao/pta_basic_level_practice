# 题目名称：集体照
# 题目编号：PAT Basic 1055
# 实现原理：
#   1. 排序：按身高升序排列，身高相同则按名字字典序升序排列
#   2. 计算每排人数：前排 N/K 人，最后一排（输出在最上面）多 N%K 人
#   3. 每排排列方法：最高的站中间，然后按先左后右（相对于观看者即先右后左）交替排列
#      实现时从最高者开始，依次向左、向右放置次高者
#   4. 从后排到前排依次输出（后排人更高，输出在上方）
#   使用 order 函数进行多级排序，自定义 pos 函数实现每排的排列。
# 时间复杂度：O(N log N)，主要由排序决定
# 空间复杂度：O(N)
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);a<-do.call(rbind,strsplit(x[-1],"\\s+"));a<-a[order(as.integer(a[,2]),a[,1]),,drop=FALSE];last<-h[1]%%h[2]+h[1]%/%h[2];pos<-function(v){r<-character(length(v));mid<-ceiling(length(v)/2);r[mid]<-v[length(v)];for(i in seq_len(length(v)-1)){idx<-if(i%%2)mid-ceiling(i/2) else mid+i/2;r[idx]<-v[length(v)-i]};r};idx<-1;for(row in 1:h[2]){cnt<-if(row==1)last else h[1]%/%h[2];cat(paste(pos(a[idx:(idx+cnt-1),1]),collapse=" "),"\n");idx<-idx+cnt}
