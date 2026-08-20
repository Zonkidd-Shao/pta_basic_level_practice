# 题目名称：子串与子列
# 题目编号：PAT Basic 1125
# 实现原理：
#   在字符串S中找出包含子列P的最短子串。子串是连续的，子列是保持顺序可不连续的。
#   若有多个最短子串，输出最靠左的那个。
#   解题思路（滑动窗口/双指针法）：1. 用左右指针维护S的一个窗口[left, right]；
#   2. 先扩展右指针，直到窗口内包含P作为子列；
#   3. 然后尝试收缩左指针，同时保持窗口包含P，记录最小窗口长度和位置；
#   4. 继续移动右指针，重复上述过程，直到遍历完S；
#   5. 最后输出最小窗口对应的子串。
#   判断子列可用贪心匹配：用指针i遍历P，遍历S的字符，遇到匹配则i++，最后i到达末尾则包含。
#   也可用预处理每个位置后各字母出现位置的方法优化匹配速度。
# 时间复杂度：O(|S|×|P|) 或 O(|S|+|P|) 取决于实现，滑动窗口遍历+子列判断
# 空间复杂度：O(1) 或 O(|S|) 取决于实现
x<-readLines("stdin",warn=FALSE);s<-strsplit(x[1],"",fixed=TRUE)[[1]];p<-strsplit(x[2],"",fixed=TRUE)[[1]];start<-rep(0L,length(p));bestL<-NA_integer_;bestR<-NA_integer_;for(r in seq_along(s)){for(j in rev(seq_along(p)))if(s[r]==p[j]&&(j==1L||start[j-1L]>0L))start[j]<-if(j==1L)r else start[j-1L];if(start[length(p)]>0L){l<-start[length(p)];if(is.na(bestL)||(r-l<bestR-bestL)||(r-l==bestR-bestL&&l<bestL)){bestL<-l;bestR<-r}}};cat(paste0(s[bestL:bestR],collapse=""),"\n")
