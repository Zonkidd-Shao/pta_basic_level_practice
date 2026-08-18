# 题目名称：D进制的A+B
# 题目编号：PAT Basic 1022
# 实现原理：
#   1. 读取输入的三个整数A、B和进制D
#   2. 计算A+B的和n
#   3. 若n为0，直接输出0
#   4. 使用除基取余法将十进制数n转换为D进制：
#      - 反复用n除以D，记录余数
#      - 将n更新为商
#      - 直到n为0
#   5. 将记录的余数反转后拼接，得到D进制表示
# 时间复杂度：O(log_D n)，每次n为A+B的和，转换过程中n不断除以D，循环次数为D进制数的位数
# 空间复杂度：O(log_D n)，需要存储D进制数的各位数字
z<-scan("stdin",what=double(),quiet=TRUE);n<-z[1]+z[2];b<-z[3];if(n==0)cat("0\n") else {r<-integer();while(n>0){r<-c(r,n%%b);n<-n%/%b};cat(paste(rev(r),collapse=""),"\n")}
