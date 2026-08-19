# 1059 C语言竞赛
#
# 题目描述：
#   C 语言竞赛是浙江大学计算机学院主持的一个欢乐的竞赛。既然竞赛主旨是为了好玩，颁奖规则也就制定得很滑稽：
#   - 0、冠军将赢得一份“神秘大奖”（比如很巨大的一本学生研究论文集……）。
#   - 1、排名为素数的学生将赢得最好的奖品 —— 小黄人玩偶！
#   - 2、其他人将得到巧克力。
#   给定比赛的最终排名以及一系列参赛者的 ID，你要给出这些参赛者应该获得的奖品。
#
# 实现原理：
#   根据排名给出不同的奖励；处理前三名、前N%和优秀奖的判断；查询多个学生的获奖情况
#

require 'set'

# 判断素数
# @param x [Integer]
# @return [Boolean]
def prime?(x)
  return false if x < 2

  (2..Math.sqrt(x).to_i).none? { |i| x % i == 0 }
end

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  rank = {}
  n.times do |i|
    id = gets(chomp: true)
    rank[id] = i + 1
  end

  checked = Set.new
  k = gets.to_i
  k.times do
    id = gets(chomp: true)
    if !rank.key?(id)
      puts "#{id}: Are you kidding?"
    elsif checked.include?(id)
      puts "#{id}: Checked"
    else
      checked.add(id)
      r = rank[id]
      prize = if r == 1
                'Mystery Award'
              elsif prime?(r)
                'Minion'
              else
                'Chocolate'
              end
      puts "#{id}: #{prize}"
    end
  end
end
