# 1105 链表合并
#
# 题目描述：
#   给定两个单链表 L_1 = a_1 \to a_2\to \cdots \to a_{n-1}\to a_n 和 L_2 = b_1 \to b_2\to \cdots \to b_{m-1}\to b_m。如果 n\ge 2m，你的任务是将比较短的那个链表逆序，然后将之并入比较长的那个链表，得到一个形如 a_1 \to a_2 \to b_{m} \to a_3 \to a_4 \to b_{m-1}\cdots  的结果。例如给定两个链表分别为 6→7 和 1→2→3→4→5，你应该输出 1→2→7→3→4→6→5。
#
# 实现原理：
#   合并两个有序链表；按元素大小交替从两个链表取节点；处理链表长度不同的情况
#

if __FILE__ == $PROGRAM_NAME
  h1, n1, h2, n2 = gets.split
  n1 = n1.to_i
  n2 = n2.to_i

  nodes = {}
  (n1 + n2).times do
    addr, data, nxt = gets.split
    nodes[addr] = { data: data, next: nxt }
  end

  list1 = []
  cur = h1
  list1 << cur && cur = nodes[cur][:next] while cur != '-1'
  list2 = []
  cur = h2
  list2 << cur && cur = nodes[cur][:next] while cur != '-1'

  merged = []
  i = 0
  while i < list1.length || i < list2.length
    merged << list1[i] if i < list1.length
    merged << list2[i] if i < list2.length
    i += 1
  end

  merged.each_with_index do |addr, idx|
    nxt = idx + 1 < merged.length ? merged[idx + 1] : '-1'
    puts "#{addr} #{nodes[addr][:data]} #{nxt}"
  end
end
