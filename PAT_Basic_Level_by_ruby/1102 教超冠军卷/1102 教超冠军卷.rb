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
  products = n.times.map do
    id, price, sales = gets.split
    [id, price.to_i, sales.to_i]
  end

  best_sales = products.max_by { |_, _, sales| sales }
  best_revenue = products.max_by { |_, price, sales| price * sales }
  puts "#{best_sales[0]} #{best_sales[2]}"
  puts "#{best_revenue[0]} #{best_revenue[1] * best_revenue[2]}"
end
