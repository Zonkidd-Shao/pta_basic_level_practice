# 1076 Wifi密码
#
# 题目描述：
#   下面是微博上流传的一张照片：“各位亲爱的同学们，鉴于大家有时需要使用 wifi，又怕耽误亲们的学习，现将 wifi 密码设置为下列数学题答案：A-1；B-2；C-3；D-4；请同学们自己作答，每两日一换。谢谢合作！！~”—— 老师们为了促进学生学习也是拼了…… 本题就要求你写程序把一系列题目的答案按照卷子上给出的对应关系翻译成 wifi 的密码。这里简单假设每道选择题都有 4 个选项，有且只有 1 个正确答案。
#   ![wifi.jpg](~/7e56be3f-caba-45f1-b9cb-38a96d44de76.jpg)
#
# 实现原理：
#   解析每道题的正确选项编号；将A/B/C/D对应为1/2/3/4；按顺序组合成WiFi密码
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  password = String.new
  n.times do
    line = gets(chomp: true)
    %w[a b c d].each_with_index do |lc, i|
      if line.include?(lc)
        password << (i + 1).to_s
        break
      end
    end
  end
  puts password
end
