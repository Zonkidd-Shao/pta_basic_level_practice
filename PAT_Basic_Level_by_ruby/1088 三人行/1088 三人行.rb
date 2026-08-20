# 1088 三人行
#
# 题目描述：
#   子曰：“三人行，必有我师焉。择其善者而从之，其不善者而改之。”
#   本题给定甲、乙、丙三个人的能力值关系为：甲的能力值确定是 2 位正整数；把甲的能力值的 2 个数字调换位置就是乙的能力值；甲乙两人能力差是丙的能力值的 X 倍；乙的能力值是丙的 Y 倍。请你指出谁比你强应“从之”，谁比你弱应“改之”。
#
# 实现原理：
#   根据已知条件推导三个人的能力值；比较三个人的能力大小关系；使用代数方法求解方程
#

if __FILE__ == $PROGRAM_NAME
  me, x, y = gets.split.map(&:to_i)
  answer = nil
  99.downto(10) do |jia|
    yi = (jia.to_s.reverse).to_i
    bing = (jia - yi).abs.to_f / x
    if (yi - bing * y).abs < 1e-9
      answer = [jia, yi, bing]
      break
    end
  end

  if answer.nil?
    puts 'No Solution'
  else
    jia, yi, bing = answer
    relation = lambda { |v| v == me ? 'Ping' : v > me ? 'Cong' : 'Gai' }
    puts "#{jia} #{relation.call(jia)} #{relation.call(yi)} #{relation.call(bing)}"
  end
end
