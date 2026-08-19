# 1112 超标区间
#
# 题目描述：
#   ![data.JPG](~/bffe725d-4709-45dc-a5c6-37eb4bd0155f.JPG)
#   上图是用某科学研究中采集的数据绘制成的折线图，其中红色横线表示正常数据的阈值（在此图中阈值是 25）。你的任务就是把超出阈值的非正常数据所在的区间找出来。例如上图中横轴 [3, 5] 区间中的 3 个数据点超标，横轴上点 9 （可以表示为区间 [9, 9]）对应的数据点也超标。
#
# 实现原理：
#   找出污染物浓度超标的连续区间；遍历数组统计连续超标的天数；输出最长超标区间的起止日期
#

if __FILE__ == $PROGRAM_NAME
  n, t = gets.split.map(&:to_i)
  arr = gets.split.map(&:to_i)
  i = 0
  while i < n
    if arr[i] > t
      j = i
      j += 1 while j < n && arr[j] > t
      puts "#{i + 1} #{j}"
      i = j
    else
      i += 1
    end
  end
end
