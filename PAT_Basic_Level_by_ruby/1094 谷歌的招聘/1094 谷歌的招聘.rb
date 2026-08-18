# 1094 谷歌的招聘
#
# 题目描述：
#   2004 年 7 月，谷歌在硅谷的 101 号公路边竖立了一块巨大的广告牌（如下图）用于招聘。内容超级简单，就是一个以 .com 结尾的网址，而前面的网址是一个 10 位素数，这个素数是自然常数 e 中最早出现的 10 位连续数字。能找出这个素数的人，就可以通过访问谷歌的这个网站进入招聘流程的下一步。
#   ![prime.jpg](~/57148679-d574-4f49-b048-775c6c07791c.jpg)
#   自然常数 e 是一个著名的超越数，前面若干位写出来是这样的：e = 2.71828182845904523536028747135266249775724709369995957496696762772407663035354759457138217852516642**7427466391**932003059921... 其中粗体标出的 10 位数就是答案。
#   本题要求你编程解决一个更通用的问题：从任一给定的长度为 L 的数字中，找出最早出现的 K 位连续数字所组成的素数。
#
# 实现原理：
#   在长数字串中寻找长度为K的素数；滑动窗口截取子串并判断是否为素数；从左到右找到第一个满足条件的子串
#

# 素数判断（适用于 <= 10 位整数）
# @param num [Integer]
# @return [Boolean]
def prime?(num)
  return false if num < 2
  return true if num < 4

  return false if num.even? || num % 3 == 0

  i = 5
  while i * i <= num
    return false if num % i == 0 || num % (i + 2) == 0

    i += 6
  end
  true
end

if __FILE__ == $PROGRAM_NAME
  n_str, k = gets.split
  k = k.to_i
  found = nil
  (0..n_str.length - k).each do |i|
    sub = n_str[i, k]
    found = sub if prime?(sub.to_i)
    break if found
  end
  puts found || '404'
end
