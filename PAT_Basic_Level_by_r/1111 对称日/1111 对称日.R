# 题目名称：对称日
# 题目编号：PAT Basic 1111
# 实现原理：
#   判断给定日期是否为对称日，即按yyyymmdd格式组成的8位字符串是否是回文串。
#   输入日期格式为英文的Month Day, Year。解题思路：1. 建立月份缩写到数字的映射；
#   2. 对每个日期，解析出年、月、日；3. 格式化为8位字符串yyyymmdd；
#   4. 判断该字符串是否等于其反转（回文判断）；5. 输出Y/N和格式化后的日期。
# 时间复杂度：O(N)，N为日期个数，每个日期处理为常数时间
# 空间复杂度：O(1)，仅使用常数空间
x <- readLines("stdin", warn = FALSE); mon <- c(Jan=1,Feb=2,Mar=3,Apr=4,May=5,Jun=6,Jul=7,Aug=8,Sep=9,Oct=10,Nov=11,Dec=12)
for (s in x[-1]) { p <- strsplit(gsub(",", "", s), "\\s+")[[1]]; v <- sprintf("%04d%02d%02d", as.integer(p[3]), mon[p[1]], as.integer(p[2])); cat(if (v == paste0(rev(strsplit(v, "")[[1]]), collapse="")) "Y" else "N", v, "\n") }
