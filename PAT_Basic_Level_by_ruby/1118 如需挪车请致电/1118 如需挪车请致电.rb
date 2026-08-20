# 1118 如需挪车请致电
#
# 题目描述：
#   ![phone.jpg](~/f29f986f-a871-4617-8fa7-e0cf4fe1d5d5.jpg)
#   上图转自新浪微博。车主用一系列简单计算给出了自己的电话号码，即：
#   2/2=1、3+2=5、\sqrt {9} = 3、\sqrt {9} = 3、0\% = 0、叁=3、5-2=3、9/3=3、1\times 3 = 3、2^3 = 8、8/2=4，最后得到的电话号码就是 153 3033 3384。
#   本题就请你写个程序自动完成电话号码的转换，以帮助那些不会计算的人。
#
# 实现原理：
#   根据车牌号和手机号的对应关系；查询车主的联系电话；使用哈希表快速查找
#

if __FILE__ == $PROGRAM_NAME
  names = %w[ling yi er san si wu liu qi ba jiu]
  results = []
  11.times do
    expression = gets.to_s.chomp
    if (match = expression.match(/\Asqrt(\d+)\z/))
      results << Math.sqrt(match[1].to_i).to_i
      next
    end

    if (match = expression.match(/\A(\d+)([+\-*\/%^])(\d+)\z/))
      left, op, right = match[1].to_i, match[2], match[3].to_i
      results << case op
                 when '+' then left + right
                 when '-' then left - right
                 when '*' then left * right
                 when '/' then left / right
                 when '%' then left % right
                 when '^' then left**right
                 end
    else
      results << names.index(expression)
    end
  end
  puts results.join
end
