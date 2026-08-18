# 1020 月饼
#
# 题目描述：
#   月饼是中国人在中秋佳节时吃的一种传统食品，不同地区有许多不同风味的月饼。现给定所有种类月饼的库存量、总售价、以及市场的最大需求量，请你计算可以获得的最大收益是多少。
#   注意：销售时允许取出一部分库存。样例给出的情形是这样的：假如我们有 3 种月饼，其库存量分别为 18、15、10 万吨，总售价分别为 75、72、45 亿元。如果市场的最大需求量只有 20 万吨，那么我们最大收益策略应该是卖出全部 15 万吨第 2 种月饼、以及 5 万吨第 3 种月饼，获得 72 + 45/2 = 94.5（亿元）。
#
# 实现原理：
#   使用贪心算法选择单价最高的月饼；按单价从高到低排序；依次装入直到达到总需求量
#

if __FILE__ == $PROGRAM_NAME
  n, d = gets.split.map(&:to_i) # n：种类数；d：最大需求量（万吨）
  stocks = gets.split.map(&:to_f)
  prices = gets.split.map(&:to_f)

  mooncakes = stocks.zip(prices).map do |stock, price|
    { stock: stock, unit: price / stock }
  end
  mooncakes.sort_by! { |m| -m[:unit] }

  profit = 0.0
  remaining = d.to_f
  mooncakes.each do |m|
    break if remaining <= 0

    take = [m[:stock], remaining].min
    profit += take * m[:unit]
    remaining -= take
  end

  printf "%.2f\n", profit
end
