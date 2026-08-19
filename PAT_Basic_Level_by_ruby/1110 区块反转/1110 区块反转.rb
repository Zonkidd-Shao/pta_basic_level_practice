# 1110 区块反转
#
# 题目描述：
#   给定一个单链表 L，我们将每 K 个结点看成一个**区块**（链表最后若不足 K 个结点，也看成一个区块），请编写程序将 L 中所有区块的链接反转。例如：给定 L 为 1→2→3→4→5→6→7→8，K 为 3，则输出应该为 7→8→4→5→6→1→2→3。
#
# 实现原理：
#   将链表分成若干个大小为K的块；按块逆序排列整个链表；块内顺序不变，块之间顺序反转
#

if __FILE__ == $PROGRAM_NAME
  head, n_str, k_str = gets.split
  n = n_str.to_i
  k = k_str.to_i

  nodes = {}
  n.times do
    addr, data, nxt = gets.split
    nodes[addr] = { data: data, next: nxt }
  end

  list = []
  cur = head
  while cur != '-1'
    list << cur
    cur = nodes[cur][:next]
  end

  result = []
  i = 0
  while i < list.length
    result.concat(list[i, k].reverse)
    i += k
  end

  result.each_with_index do |addr, idx|
    nxt = idx + 1 < result.length ? result[idx + 1] : '-1'
    puts "#{addr} #{nodes[addr][:data]} #{nxt}"
  end
end
