# 题目名称：区块反转
# 题目编号：PAT Basic 1110
# 实现原理：
#   将单链表每K个结点分为一个区块（最后不足K个也成一块），然后反转所有区块的顺序。
#   例如1→2→3→4→5→6→7→8，K=3，结果为7→8→4→5→6→1→2→3。
#   解题思路：1. 用哈希表存储结点地址到数据和下一地址的映射；
#   2. 遍历链表得到结点地址序列；3. 将地址序列按每K个分块；
#   4. 反转块的顺序，再拼接成新的地址序列；5. 按新顺序输出链表。
# 时间复杂度：O(N)，N为结点数，遍历、分块、反转、输出均为线性
# 空间复杂度：O(N)，存储结点信息和地址序列
x <- readLines("stdin", warn = FALSE); h <- strsplit(x[1], "\\s+")[[1]]; head <- h[1]; k <- as.integer(h[3]); d <- list()
for (s in x[-1]) { p <- strsplit(s, "\\s+")[[1]]; d[[p[1]]] <- p[2:3] }
ids <- character(); q <- head
while (q != "-1") { ids <- c(ids, q); q <- d[[q]][2] }
blocks <- split(ids, ceiling(seq_along(ids) / k)); ids <- unlist(rev(blocks), use.names = FALSE)
for (i in seq_along(ids)) cat(ids[i], d[[ids[i]]][1], if (i == length(ids)) "-1" else ids[i + 1L], "\n")
