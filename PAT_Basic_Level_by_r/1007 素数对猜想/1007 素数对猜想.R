# 题目名称：素数对猜想
# 题目编号：PAT Basic 1007
# 实现原理：
#   首先用试除法判断每个数是否为素数（检查从 2 到 sqrt(x) 之间是否有因数）。
#   找出 2 到 n 之间的所有素数，然后计算相邻素数的差值，统计差值为 2 的素数对个数。
#   注意：n < 5 时不存在素数对（最小的素数对是 3 和 5）。
# 时间复杂度：O(n * sqrt(n)) - 对每个数用试除法判断素性，共 n 个数，每个数需检查到 sqrt(n)
# 空间复杂度：O(n) - 存储所有素数
n <- as.integer(scan("stdin",quiet=TRUE)[1]); prime <- function(x) x > 1L && !any(x %% 2L:floor(sqrt(x)) == 0L); if(n < 5L) cat("0\n") else { p <- which(vapply(2:n, prime, logical(1))) + 1L; cat(sum(diff(p)==2L),"\n") }
