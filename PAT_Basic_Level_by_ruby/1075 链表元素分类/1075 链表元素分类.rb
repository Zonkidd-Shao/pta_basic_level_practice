# 1075 链表元素分类
#
# 题目描述：
#   给定一个单链表，请编写程序将链表元素进行分类排列，使得所有负值元素都排在非负值元素的前面，而 [0, K] 区间内的元素都排在大于 K 的元素前面。但每一类内部元素的顺序是不能改变的。例如：给定链表为 18→7→-4→0→5→-6→10→11→-2，K 为 10，则输出应该为 -4→-6→-2→7→0→5→10→18→11。
#
# 实现原理：
#   遍历链表并按值分类存放；按顺序拼接三类链表（负数、区间内、大于K）；使用数组存储链表节点便于重排
#

if __FILE__ == $PROGRAM_NAME
  head, n_str, k_str = gets.split
  n = n_str.to_i
  k = k_str.to_i

  nodes = {}
  n.times do
    addr, data, nxt = gets.split
    nodes[addr] = { data: data.to_i, next: nxt }
  end

  list = []
  cur = head
  while cur != '-1'
    list << cur
    cur = nodes[cur][:next]
  end

  neg = list.select { |a| nodes[a][:data] < 0 }
  mid = list.select { |a| nodes[a][:data] >= 0 && nodes[a][:data] <= k }
  high = list.select { |a| nodes[a][:data] > k }
  ordered = neg + mid + high

  ordered.each_with_index do |addr, i|
    nxt = i + 1 < ordered.length ? ordered[i + 1] : '-1'
    puts "#{addr} #{nodes[addr][:data]} #{nxt}"
  end
end
