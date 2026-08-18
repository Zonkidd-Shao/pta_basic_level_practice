# 题目名称：危险品装箱
# 题目编号：PAT Basic 1090
# 实现原理：
#   使用哈希表存储不相容物品对，对每箱货物检查是否存在任意一对不相容物品。
#   关键步骤：
#   1. 读取不相容物品对数N和集装箱数M
#   2. 用环境（哈希表）存储不相容物品对：将两个物品编号排序后用#连接作为key
#   3. 对每个集装箱货物清单：
#      - 提取所有物品编号
#      - 双重循环枚举所有物品对
#      - 检查该物品对是否在不相容哈希表中
#      - 若存在不相容对则输出No，否则输出Yes
#   物品对排序后存储，避免(a,b)和(b,a)重复存储，确保查询一致性。
#   使用环境(enviroment)作为哈希表，查找时间为O(1)。
# 时间复杂度：O(N + M * K²)，N为不相容对数，M为集装箱数，K为每箱物品数
# 空间复杂度：O(N)，存储不相容物品对的哈希表
x <- readLines("stdin", warn = FALSE)
h <- as.integer(strsplit(x[1], "\\s+")[[1]])
bad <- new.env(hash = TRUE, parent = emptyenv())
for (i in seq_len(h[1])) {
  p <- strsplit(x[i + 1L], "\\s+")[[1]]
  assign(paste(sort(p), collapse = "#"), TRUE, envir = bad)
}
for (s in x[(h[1] + 2L):length(x)]) {
  p <- strsplit(s, "\\s+")[[1]][-1L]
  ok <- TRUE
  if (length(p) > 1L) for (i in 1:(length(p) - 1L)) for (j in (i + 1L):length(p))
    if (exists(paste(sort(c(p[i], p[j])), collapse = "#"), envir = bad, inherits = FALSE)) ok <- FALSE
  cat(if (ok) "Yes" else "No", "\n")
}
