# 1084 外观数列
#
# 题目描述：
#   外观数列是指具有以下特点的整数序列：
#   ```
#   d, d1, d111, d113, d11231, d112213111, ...
#   ```
#   它从不等于 1 的数字 `d` 开始，序列的第 n+1 项是对第 n 项的描述。比如第 2 项表示第 1 项有 1 个 `d`，所以就是 `d1`；第 2 项是 1 个 `d`（对应 `d1`）和 1 个 1（对应 11），所以第 3 项就是 `d111`。又比如第 4 项是 `d113`，其描述就是 1 个 `d`，2 个 1，1 个 3，所以下一项就是 `d11231`。当然这个定义对 `d` = 1 也成立。本题要求你推算任意给定数字 `d` 的外观数列的第 N 项。
#
# 实现原理：
#   外观数列：描述前一项的数字组成；遍历当前项，统计连续相同数字的个数；迭代N次得到第N项
#

if __FILE__ == $PROGRAM_NAME
  d, n = gets.split
  n = n.to_i
  cur = d

  (n - 1).times do
    nxt = String.new
    i = 0
    while i < cur.length
      c = cur[i]
      j = i
      j += 1 while j < cur.length && cur[j] == c
      nxt << c << (j - i).to_s
      i = j
    end
    cur = nxt
  end

  puts cur
end
