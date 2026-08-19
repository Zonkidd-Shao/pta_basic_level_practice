# 1019 数字黑洞
#
# 题目描述：
#   给定任一个各位数字不完全相同的 4 位正整数，如果我们先把 4 个数字按非递增排序，再按非递减排序，然后用第 1 个数字减第 2 个数字，将得到一个新的数字。一直重复这样做，我们很快会停在有“数字黑洞”之称的 `6174`，这个神奇的数字也叫 Kaprekar 常数。
#   例如，我们从`6767`开始，将得到
#   ```
#   7766 - 6677 = 1089
#   9810 - 0189 = 9621
#   9621 - 1269 = 8352
#   8532 - 2358 = 6174
#   7641 - 1467 = 6174
#   ... ...
#   ```
#   现给定任意 4 位正整数，请编写程序演示到达黑洞的过程。
#
# 实现原理：
#   对4位数字进行降序和升序排列；计算两数之差得到新数字；重复操作直到进入6174黑洞，统计步数
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i

  if n.to_s.chars.uniq.length == 1
    printf "%04d - %04d = 0000\n", n, n
  else
    cur = n
    loop do
      digits = cur.to_s.rjust(4, '0').chars.map(&:to_i)
      asc = digits.sort
      desc = asc.reverse
      big = desc.join.to_i
      small = asc.join.to_i
      diff = big - small
      printf "%04d - %04d = %04d\n", big, small, diff
      break if diff == 6174

      cur = diff
    end
  end
end
