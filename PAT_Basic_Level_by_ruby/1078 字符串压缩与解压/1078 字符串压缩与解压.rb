# 1078 字符串压缩与解压
#
# 题目描述：
#   文本压缩有很多种方法，这里我们只考虑最简单的一种：把由相同字符组成的一个连续的片段用这个字符和片段中含有这个字符的个数来表示。例如 `ccccc` 就用 `5c` 来表示。如果字符没有重复，就原样输出。例如 `aba` 压缩后仍然是 `aba`。
#   解压方法就是反过来，把形如 `5c` 这样的表示恢复为 `ccccc`。
#   本题需要你根据压缩或解压的要求，对给定字符串进行处理。这里我们简单地假设原始字符串是完全由英文字母和空格组成的非空字符串。
#
# 实现原理：
#   根据指令执行压缩或解压操作；压缩：统计连续相同字符，用数字+字符表示；解压：根据数字展开重复字符
#

if __FILE__ == $PROGRAM_NAME
  mode = gets(chomp: true)
  text = gets(chomp: true)

  if mode == 'C'
    result = String.new
    i = 0
    while i < text.length
      c = text[i]
      j = i
      j += 1 while j < text.length && text[j] == c
      count = j - i
      result << (count > 1 ? "#{count}#{c}" : c)
      i = j
    end
    puts result
  else
    result = String.new
    i = 0
    while i < text.length
      num = 0
      while i < text.length && text[i] =~ /\d/
        num = num * 10 + text[i].to_i
        i += 1
      end
      c = text[i]
      i += 1
      result << (num.positive? ? c * num : c.to_s)
    end
    puts result
  end
end
