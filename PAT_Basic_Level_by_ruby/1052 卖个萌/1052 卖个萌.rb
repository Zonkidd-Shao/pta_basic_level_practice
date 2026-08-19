# 1052 卖个萌
#
# 题目描述：
#   萌萌哒表情符号通常由“手”、“眼”、“口”三个主要部分组成。简单起见，我们假设一个表情符号是按下列格式输出的：
#   ```
#   [左手]([左眼][口][右眼])[右手]
#   ```
#   现给出可选用的符号集合，请你按用户的要求输出表情。
#
# 实现原理：
#   解析左括号、右括号和竖线符号；提取左右手中的表情符号；按格式输出组合后的表情
#

if __FILE__ == $PROGRAM_NAME
  sets = []
  3.times { sets << gets(chomp: true).scan(/\[[^\]]*\]/) }

  n = gets.to_i
  n.times do
    a, b, c = gets.split.map(&:to_i)
    if a < 1 || a > sets[0].length || b < 1 || b > sets[1].length || c < 1 || c > sets[2].length
      puts 'Are you kidding me? @\/@'
    else
      puts sets[0][a - 1] + sets[1][b - 1] + sets[2][c - 1]
    end
  end
end
