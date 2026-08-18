# 题目名称：查验身份证
# 题目编号：PAT Basic 1031
# 实现原理：
#   1. 读取输入：身份证号码个数N，以及N个身份证号码
#   2. 定义加权因子数组w和校验码映射表m
#   3. 对每个身份证号码进行验证：
#      - 先用正则表达式检查格式是否正确（前17位是数字，第18位是数字或X）
#      - 计算前17位数字的加权和
#      - 对11取模得到Z值
#      - 根据Z值查表得到校验码
#      - 与实际校验码比较是否一致
#   4. 收集所有有问题的身份证号码
#   5. 如有问题号码则依次输出，否则输出"All passed"
# 时间复杂度：O(n)，其中n为身份证号码个数，每个号码验证只需O(1)时间
# 空间复杂度：O(n)，最坏情况存储所有有问题的号码
x<-readLines("stdin",warn=FALSE);w<-c(1,0,10,9,8,7,6,5,4,3,2);m<-strsplit("10X98765432","")[[1]];bad<-x[-1][!vapply(x[-1],function(s){if(!grepl("^\\d{17}[0-9X]$",s))return(FALSE);d<-as.integer(strsplit(substr(s,1,17),"")[[1]]);m[sum(d*w)%%11+1L]==substr(s,18,18)},logical(1))];cat(if(length(bad))paste(bad,collapse="\n") else "All passed", "\n")
