# 1070 结绳
#
# 题目描述：
#   给定一段一段的绳子，你需要把它们串成一条绳。每次串连的时候，是把两段绳子对折，再如下图所示套接在一起。这样得到的绳子又被当成是另一段绳子，可以再次对折去跟另一段绳子串连。每次串连后，原来两段绳子的长度就会减半。
#   ![rope.jpg](~/46293e57-aa0e-414b-b5c3-7c4b2d5201e2.jpg)
#   给定 N 段绳子的长度，你需要找出它们能串成的绳子的最大长度。
#
# 实现原理：
#   将所有绳子按从小到大排序；每次将最短的两根绳子结在一起（长度变为原来的一半）；使用贪心策略，最后得到的绳子最长
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  ropes = gets.split.map(&:to_f).sort

  while ropes.length > 1
    a = ropes.shift
    b = ropes.shift
    ropes << (a + b) / 2
    ropes.sort!
  end

  puts ropes[0].to_i
end
