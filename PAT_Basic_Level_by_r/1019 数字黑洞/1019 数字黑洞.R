# 题目名称：数字黑洞
# 题目编号：PAT Basic 1019
# 实现原理：
#   Kaprekar 常数问题：对任意 4 位数字不全相同的正整数，
#   将各位数字降序排列得到最大数，升序排列得到最小数，用最大数减最小数得到新数。
#   重复此过程最终会得到 6174（数字黑洞）。
#   解题思路：用循环反复执行排序-相减操作，每次输出计算过程，
#   直到结果为 6174 或 0（各位数字全相等时）。
#   注意每个数字按 4 位格式输出，不足补前导 0。
# 时间复杂度：O(1) - 最多 7 步必达 6174，循环次数为常数
# 空间复杂度：O(1) - 只使用常数额外空间
n<-scan("stdin",what="",quiet=TRUE)[1];repeat{d<-sort(strsplit(sprintf("%04d",as.integer(n)),"")[[1]]);lo<-as.integer(paste(d,collapse=""));hi<-as.integer(paste(rev(d),collapse=""));v<-hi-lo;cat(sprintf("%04d - %04d = %04d\n",hi,lo,v));if(v==6174L||v==0L)break;n<-v}
