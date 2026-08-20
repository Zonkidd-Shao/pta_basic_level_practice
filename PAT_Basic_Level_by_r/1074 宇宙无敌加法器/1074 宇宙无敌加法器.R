# 题目名称：宇宙无敌加法器
# 题目编号：PAT Basic 1074
# 实现原理：
#   实现不同进制的大整数加法。从最低位开始，逐位相加，
#   每一位的进制由进制表对应位置决定（0表示十进制）。
#   处理进位，直到所有位都加完。如果最后还有进位则添加到结果最高位。
#   采用双指针从两个数字的末尾向前遍历，模拟手工加法过程。
# 时间复杂度：O(N)，N为数字的最大位数（最多20位）
# 空间复杂度：O(N)，存储结果
x<-readLines("stdin",warn=FALSE);base<-as.integer(strsplit(x[1],"",fixed=TRUE)[[1]]);a<-as.integer(strsplit(x[2],"",fixed=TRUE)[[1]]);b<-as.integer(strsplit(x[3],"",fixed=TRUE)[[1]]);L<-max(length(a),length(b));a<-c(rep(0L,L-length(a)),a);b<-c(rep(0L,L-length(b)),b);carry<-0L;out<-character(L);for(i in L:1){pos<-L-i+1;rad<-if(length(base)>=pos)base[length(base)-pos+1L]else 0L;if(rad==0)rad<-10;s<-a[i]+b[i]+carry;out[i]<-as.character(s%%rad);carry<-s%/%rad};if(carry>0)out<-c(as.character(carry),out);out<-sub("^0+(?=.)","",paste0(out,collapse=""),perl=TRUE);cat(out,"\n",sep="")
