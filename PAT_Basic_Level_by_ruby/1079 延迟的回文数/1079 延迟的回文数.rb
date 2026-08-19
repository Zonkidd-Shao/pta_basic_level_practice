# 1079 延迟的回文数
#
# 题目描述：
#   给定一个 k+1 位的正整数 N，写成 a_k \cdots a_1 a_0 的形式，其中对所有 i 有 0 \le a_i < 10 且 a_k > 0。N 被称为一个**回文数**，当且仅当对所有 i 有 a_i = a_{k-i}。零也被定义为一个回文数。
#   非回文数也可以通过一系列操作变出回文数。首先将该数字逆转，再将逆转数与该数相加，如果和还不是一个回文数，就重复这个逆转再相加的操作，直到一个回文数出现。如果一个非回文数可以变出回文数，就称这个数为**延迟的回文数**。（定义翻译自 https://en.wikipedia.org/wiki/Palindromic_number ）
#   给定任意一个正整数，本题要求你找到其变出的那个回文数。
#
# 实现原理：
#   判断一个数是否为回文数；如果不是，将其与反转后的数相加；重复操作直到得到回文数或达到步数上限
#

if __FILE__ == $PROGRAM_NAME
  n = gets(chomp: true)

  if n == n.reverse
    puts "#{n} is a palindromic number."
    exit
  end

  found = false
  10.times do
    rev = n.reverse
    sum = (n.to_i + rev.to_i).to_s
    puts "#{n} + #{rev} = #{sum}"
    if sum == sum.reverse
      puts "#{sum} is a palindromic number."
      found = true
      break
    end
    n = sum
  end

  puts 'Not found in 10 iterations.' unless found
end
