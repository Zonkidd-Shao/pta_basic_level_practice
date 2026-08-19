# 1102 教超冠军卷
#
# 题目描述：
#   “教育超市”是拼题 A 系统的一个衍生产品，发布了各种试卷和练习供用户选购。在试卷列表中，系统不仅列出了每份试卷的单价，还显示了当前的购买人次。本题就请你根据这些信息找出教育超市所有试卷中的销量（即购买人次）冠军和销售额冠军。
#
# 实现原理：
#   统计每种商品的销售额和销量；找出销售额最高和销量最高的商品；累加计算汇总数据
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  products = {}
  n.times do
    id, price, stock = gets.split
    products[id] = { price: price.to_f, stock: stock.to_i, revenue: 0.0 }
  end

  m = gets.to_i
  m.times do
    id, qty = gets.split
    qty = qty.to_i
    p = products[id]
    if p && p[:stock] >= qty
      amount = p[:price] * qty
      p[:stock] -= qty
      p[:revenue] += amount
      printf "%.2f\n", amount
    else
      puts "Sorry, we don't have enough items."
    end
  end

  best = products.max_by { |_, p| p[:revenue] }
  printf "%s %.2f\n", best[0], best[1][:revenue]
end
