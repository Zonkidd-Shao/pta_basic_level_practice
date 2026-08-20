# 题目名称：全素日
# 题目编号：PAT Basic 1114
# 实现原理：
#   判断给定日期(yyyymmdd格式)是否为全素日。全素日定义：日期本身是素数，
#   且其任何以末尾数字结尾的子串对应的数字都是素数。
#   解题思路：1. 实现素数判断函数（试除法，优化：先判偶，再试奇数因子到√n）；
#   2. 从第1位到最后一位，依次取子串s[i..end]，转换为整数判断是否为素数；
#   3. 每行输出子串和Yes/No；4. 若所有子串都是素数，最后输出"All Prime!"。
#   注意：子串可能有前导零，但转成数值后不影响素数判断。
# 时间复杂度：O(L × √V)，L为日期长度(8)，V为子串最大值(约10^8)，每次判断素数到√V
# 空间复杂度：O(1)，仅使用常数空间
s <- scan("stdin", what="", quiet=TRUE)[1]
prime <- function(n) { if(n<2) return(FALSE); if(n==2) return(TRUE); if(n%%2==0) return(FALSE); if(n<9) return(TRUE); !any(n %% seq(3, floor(sqrt(n)), by=2) == 0) }
ok <- TRUE
for(i in seq_len(nchar(s))) { v <- substr(s,i,nchar(s)); yes <- prime(as.numeric(v)); cat(v, if(yes) "Yes" else "No", "\n"); ok <- ok && yes }
if(ok) cat("All Prime!\n")
