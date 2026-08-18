# 题目名称：换个格式输出整数
# 题目编号：PAT Basic 1006
# 实现原理：
#   将输入的正整数 n 格式化为 3 位字符串（不足补前导0），拆分为百位、十位、个位三个数字。
#   百位数字对应输出相应个数的 'B'，十位对应 'S'，个位输出 1 到 n 的序列。
#   使用 strrep 函数重复字符，paste0 拼接输出字符串。
# 时间复杂度：O(1) - 输入最多 3 位数，操作次数固定
# 空间复杂度：O(1) - 只使用常数额外空间
n <- as.integer(scan("stdin", quiet=TRUE)[1]); s <- sprintf("%03d", n); d <- as.integer(strsplit(s, "")[[1]]); cat(paste0(strrep("B", d[1]), strrep("S", d[2]), paste0(seq_len(d[3])-1L, collapse="")), "\n")
