# 1035 插入与归并
#
# 题目描述：
#   根据维基百科的定义：
#   现给定原始序列和由某排序算法产生的中间序列，请你判断该算法究竟是哪种排序算法？
#
# 实现原理：
#   模拟插入排序和归并排序的过程；逐步比较判断当前序列属于哪种排序的中间结果；继续执行下一步并输出
#

# 自底向上归并排序的一趟（合并相邻长度为 length 的有序段）
# @param arr [Array<Integer>]
# @param n [Integer]
# @param length [Integer]
# @return [Array<Integer>]
def merge_pass(arr, n, length)
  result = arr.dup
  i = 0
  while i < n
    left = i
    mid = [i + length, n].min
    right = [i + 2 * length, n].min
    a = arr[left...mid]
    b = arr[mid...right]
    merged = []
    ai = bi = 0
    while ai < a.length && bi < b.length
      if a[ai] <= b[bi]
        merged << a[ai]
        ai += 1
      else
        merged << b[bi]
        bi += 1
      end
    end
    merged.concat(a[ai..]) if ai < a.length
    merged.concat(b[bi..]) if bi < b.length
    result[left...right] = merged
    i += 2 * length
  end
  result
end

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  original = gets.split.map(&:to_i)
  target = gets.split.map(&:to_i)

  # 先尝试插入排序
  arr = original.dup
  is_insertion = false
  (1...n).each do |i|
    val = arr[i]
    j = i - 1
    while j >= 0 && arr[j] > val
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = val
    if arr == target
      is_insertion = true
      # 再迭代一步
      i2 = i + 1
      if i2 < n
        val = arr[i2]
        j = i2 - 1
        while j >= 0 && arr[j] > val
          arr[j + 1] = arr[j]
          j -= 1
        end
        arr[j + 1] = val
      end
      break
    end
  end

  if is_insertion
    puts 'Insertion Sort'
    puts arr.join(' ')
  else
    # 归并排序
    arr = original.dup
    length = 1
    loop do
      arr = merge_pass(arr, n, length)
      if arr == target
        length *= 2
        arr = merge_pass(arr, n, length)
        break
      end
      length *= 2
    end
    puts 'Merge Sort'
    puts arr.join(' ')
  end
end
