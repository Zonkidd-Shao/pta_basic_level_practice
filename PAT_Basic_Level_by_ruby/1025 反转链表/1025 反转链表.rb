# 1025 反转链表
#
# 题目描述：
#   给定一个常数 K 以及一个单链表 L，请编写程序将 L 中每 K 个结点反转。例如：给定 L 为 1→2→3→4→5→6，K 为 3，则输出应该为 3→2→1→6→5→4；如果 K 为 4，则输出应该为 4→3→2→1→5→6，即最后不到 K 个元素不反转。
#
# 实现原理：
#   使用数组模拟链表结构；按每K个节点为一组进行反转；处理链表遍历和指针调整
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

  # 按 next 指针从 head 出发，构建实际链表（忽略悬挂结点）
  list = []
  cur = head
  while cur != '-1'
    list << cur
    cur = nodes[cur][:next]
  end

  # 每 K 个一组反转
  result = []
  i = 0
  while i < list.length
    if i + k <= list.length
      result.concat(list[i, k].reverse)
      i += k
    else
      result.concat(list[i..])
      break
    end
  end

  result.each_with_index do |addr, idx|
    nxt_addr = idx + 1 < result.length ? result[idx + 1] : '-1'
    puts "#{addr} #{nodes[addr][:data]} #{nxt_addr}"
  end
end
