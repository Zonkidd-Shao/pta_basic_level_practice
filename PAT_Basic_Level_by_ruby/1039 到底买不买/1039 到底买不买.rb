# 1039 到底买不买
#
# 题目描述：
#   小红想买些珠子做一串自己喜欢的珠串。卖珠子的摊主有很多串五颜六色的珠串，但是不肯把任何一串拆散了卖。于是小红要你帮忙判断一下，某串珠子里是否包含了全部自己想要的珠子？如果是，那么告诉她有多少多余的珠子；如果不是，那么告诉她缺了多少珠子。
#   为方便起见，我们用[0-9]、[a-z]、[A-Z]范围内的字符来表示颜色。例如在图1中，第3串是小红想做的珠串；那么第1串可以买，因为包含了全部她想要的珠子，还多了8颗不需要的珠子；第2串不能买，因为没有黑色珠子，并且少了一颗红色的珠子。
#   ![figbuy.jpg](~/b7e2ffa6-8819-436d-ad79-a41263abe914.jpg)
#   图 1
#
# 实现原理：
#   统计商店中各颜色珠子的数量；检查需要的珠子是否都有足够数量；计算缺失或多余的珠子数量
#

if __FILE__ == $PROGRAM_NAME
  shop = gets(chomp: true)
  want = gets(chomp: true)

  avail = shop.chars.tally
  missing = 0
  want.chars.each do |ch|
    if avail[ch] && avail[ch].positive?
      avail[ch] -= 1
    else
      missing += 1
    end
  end

  if missing.zero?
    puts "Yes #{shop.length - want.length}"
  else
    puts "No #{missing}"
  end
end
