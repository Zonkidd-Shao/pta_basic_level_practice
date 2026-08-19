# 1120 买地攻略
#
# 题目描述：
#   数码城市有土地出售。待售的土地被划分成若干块，每一块标有一个价格。这里假设每块土地只有两块相邻的土地，除了开头和结尾的两块是只有一块邻居的。每位客户可以购买多块连续相邻的土地。
#   现给定这一系列土地的标价，请你编写程序，根据客户手头的现金量，告诉客户有多少种不同的购买方案。
#
# 实现原理：
#   在预算范围内选择最大面积的土地；使用动态规划或贪心策略；计算不同地块的性价比
#

if __FILE__ == $PROGRAM_NAME
  n, m = gets.split.map(&:to_i)
  prices = gets.split.map(&:to_i).sort

  count = 0
  spent = 0
  prices.each do |p|
    break if spent + p > m

    spent += p
    count += 1
  end
  puts "#{count} #{spent}"
end
