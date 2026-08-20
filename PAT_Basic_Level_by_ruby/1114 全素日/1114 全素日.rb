# 1114 全素日
#
# 题目描述：
#   ![wbfg.JPG](~/f4c6f880-b7ed-4893-b10f-045937586870.JPG)
#   以上图片来自新浪微博，展示了一个非常酷的“全素日”：2019年5月23日。即不仅`20190523`本身是个素数，它的任何以末尾数字`3`结尾的子串都是素数。
#   本题就请你写个程序判断一个给定日期是否是“全素日”。
#
# 实现原理：
#   判断一个日期是否所有部分都是素数；依次检查年、月、日及其组合是否为素数；素数判断和日期验证
#

if __FILE__ == $PROGRAM_NAME
  def prime?(number)
    return false if number < 2
    return true if number == 2
    return false if number.even?

    (3..Math.sqrt(number).to_i).step(2).none? { |d| (number % d).zero? }
  end

  date = gets.to_s.chomp
  all_prime = true
  date.length.downto(1) do |length|
    part = date[date.length - length, length]
    is_prime = prime?(part.to_i)
    all_prime = false unless is_prime
    puts "#{part} #{is_prime ? 'Yes' : 'No'}"
  end
  puts 'All Prime!' if all_prime
end
