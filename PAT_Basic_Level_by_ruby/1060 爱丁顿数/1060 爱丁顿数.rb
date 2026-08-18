# 1060 爱丁顿数
#
# 题目描述：
#   英国天文学家爱丁顿很喜欢骑车。据说他为了炫耀自己的骑车功力，还定义了一个“爱丁顿数” E ，即满足有 E 天骑车超过 E 英里的最大整数 E。据说爱丁顿自己的 E 等于87。
#   现给定某人 N 天的骑车距离，请你算出对应的爱丁顿数 E（\le N）。
#
# 实现原理：
#   将骑车里程按降序排序；找到最大的E满足有E天骑车超过E英里；使用排序加遍历或二分查找
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  arr = gets.split.map(&:to_i).sort.reverse

  e = 0
  (1..n).each do |i|
    break unless arr[i - 1] > i

    e = i
  end
  puts e
end
