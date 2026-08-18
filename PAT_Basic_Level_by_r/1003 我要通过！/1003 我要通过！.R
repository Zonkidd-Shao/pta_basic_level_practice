# 题目名称：我要通过！
# 题目编号：PAT Basic 1003
# 实现原理：
#   题目给出三个条件，通过数学归纳可推导出正确字符串必须满足：
#   1. 只包含 P、A、T 三种字符
#   2. P 和 T 各出现且仅出现一次
#   3. P 必须在 T 之前，且 PT 之间至少有一个 A
#   4. 设 P 左边有 a 个 A，PT 之间有 b 个 A，T 右边有 c 个 A，则 a * b == c
#   该公式由条件2（xPATx，此时a=c，b=1）和条件3（递推关系）归纳得出。
#   对每个字符串依次检验以上条件即可。
# 时间复杂度：O(n * L) - n 为字符串个数，L 为字符串最大长度（100），每个字符串需正则匹配和定位
# 空间复杂度：O(1) - 只使用常数额外空间
lines <- readLines("stdin", warn = FALSE); n <- as.integer(lines[1])
ok <- function(x) { if (grepl("[^PAT]", x) || lengths(regmatches(x, gregexpr("P", x))) != 1 || lengths(regmatches(x, gregexpr("T", x))) != 1) return(FALSE); p <- regexpr("P",x)[1]; t <- regexpr("T",x)[1]; a <- p-1L; b <- t-p-1L; c <- nchar(x)-t; b > 0L && a*b == c }
cat(paste(ifelse(vapply(lines[-1L], ok, logical(1)), "YES", "NO"), collapse="\n"), "\n")
