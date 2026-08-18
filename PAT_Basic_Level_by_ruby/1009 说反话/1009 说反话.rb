# 1009 说反话
#
# 题目描述：
#   给定一句英语，要求你编写程序，将句中所有单词的顺序颠倒输出。
#
# 实现原理：
#   按空格分割字符串为单词数组；反转数组顺序；用空格重新连接成反转后的句子
#

if __FILE__ == $PROGRAM_NAME
  line = gets(chomp: true)
  # 按空白分割得到单词，再逆序拼接
  words = line.split
  puts words.reverse.join(' ')
end
