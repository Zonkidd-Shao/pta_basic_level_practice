# 1109 擅长C
#
# 题目描述：
#   当你被面试官要求用 C 写一个“Hello World”时，有本事像下图显示的那样写一个出来吗？
#   ![HWC.jpg](~/ba3b8678-061d-4fc6-a87e-ce08e1434410.jpg)
#
# 实现原理：
#   根据关键词判断对应的C语言关键字；匹配输入输出对应的C语句；字符串匹配和分类处理
#

if __FILE__ == $PROGRAM_NAME
  glyphs = 26.times.map { 7.times.map { gets.chomp } }
  sentence = gets.to_s.chomp
  words = sentence.scan(/[A-Z]+/)

  words.each_with_index do |word, word_index|
    puts if word_index.positive?
    7.times do |row|
      puts word.chars.map { |char| glyphs[char.ord - 'A'.ord][row] }.join(' ')
    end
  end
end
