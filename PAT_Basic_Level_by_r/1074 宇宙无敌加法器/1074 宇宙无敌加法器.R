# 题目名称：宇宙无敌加法器
# 题目编号：PAT Basic 1074
# 实现原理：
#   实现不同进制的大整数加法。从最低位开始，逐位相加，
#   每一位的进制由进制表对应位置决定（0表示十进制）。
#   处理进位，直到所有位都加完。如果最后还有进位则添加到结果最高位。
#   采用双指针从两个数字的末尾向前遍历，模拟手工加法过程。
# 时间复杂度：O(N)，N为数字的最大位数（最多20位）
# 空间复杂度：O(N)，存储结果
x<-readLines("stdin",warn=FALSE);base<-as.integer(strsplit(x[1],"")[[1]]);a<-as.integer(strsplit(x[2],"")[[1]]);b<-as.integer(strsplit(x[3],"")[[1]]);i<-length(a);j<-length(b);k<-length(base);carry<-0;out<-integer();while(i>0||j>0){s<-carry+if(i>0)a[i]else 0+if(j>0)b[j]else 0;rad<-base[k];if(rad==0)rad<-10;out<-c(s%%rad,out);carry<-s%/%rad;i<-i-1;j<-j-1;k<-k-1};if(carry)out<-c(carry,out);cat(paste(out,collapse=""),"\n")
