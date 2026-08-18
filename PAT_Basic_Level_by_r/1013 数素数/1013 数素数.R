# 题目名称：数素数
# 题目编号：PAT Basic 1013
# 实现原理：
#   给定 M 和 N，输出第 M 到第 N 个素数。
#   使用试除法判断素数（检查从 2 到 sqrt(x) 之间是否有因数）。
#   从 2 开始逐个判断，收集素数直到达到第 N 个，然后取出第 M 到第 N 个素数，
#   按每行 10 个的格式输出。
# 时间复杂度：O(P_N * sqrt(P_N)) - P_N 是第 N 个素数的大小，每个数需试除到其平方根
# 空间复杂度：O(N) - 存储前 N 个素数
z <- as.integer(scan("stdin",quiet=TRUE)); m <- z[1]; n <- z[2]
prime <- function(x) { if (x < 2L) return(FALSE); if (x == 2L) return(TRUE); !any(x %% 2L:floor(sqrt(x)) == 0L) }
vals <- integer(); x <- 2L
while (length(vals) < n) { if (prime(x)) vals <- c(vals, x); x <- x + 1L }
ans <- vals[m:n]
for (i in seq(1L, length(ans), by = 10L)) cat(paste(ans[i:min(i + 9L, length(ans))], collapse = " "), "\n")
