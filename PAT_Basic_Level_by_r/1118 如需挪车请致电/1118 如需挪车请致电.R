# 题目名称：如需挪车请致电
# 题目编号：PAT Basic 1118
# 实现原理：
#   解析11行计算公式，每行计算出1位数字，拼接成11位电话号码。
#   支持的运算：加减乘除、取余、开平方、指数、中文数字（ling到jiu）。
#   解题思路：1. 建立中文数字到阿拉伯数字的映射；
#   2. 对每行公式，判断类型：若为中文数字直接转换；若以sqrt开头则开平方；
#   3. 否则用正则表达式匹配两个操作数和运算符，执行对应运算；
#   4. 将11个结果依次拼接成电话号码输出。
#   关键：用正则解析算术表达式，分情况处理不同运算类型。
# 时间复杂度：O(1)，固定11行，每行处理为常数时间
# 空间复杂度：O(1)，仅使用常数空间
x <- readLines("stdin", warn = FALSE); cn <- c(ling=0,yi=1,er=2,san=3,si=4,wu=5,liu=6,qi=7,ba=8,jiu=9)
f <- function(s) { if (s %in% names(cn)) return(cn[s]); if (startsWith(s,"sqrt")) return(sqrt(as.numeric(substr(s,5,nchar(s))))); m <- regexec("^(\\d+)([+*/%^-])(\\d+)$",s); p <- regmatches(s,m)[[1]]; if(p[2]=="+")as.numeric(p[1])+as.numeric(p[3]) else if(p[2]=="-")as.numeric(p[1])-as.numeric(p[3]) else if(p[2]=="*")as.numeric(p[1])*as.numeric(p[3]) else if(p[2]=="/")as.numeric(p[1])/as.numeric(p[3]) else if(p[2]=="%")as.numeric(p[1])%%as.numeric(p[3]) else as.numeric(p[1])^as.numeric(p[3]) }
cat(paste0(vapply(x,f,numeric(1)),collapse=""),"\n")
