# 1014 福尔摩斯的约会
#
# 题目描述：
#   大侦探福尔摩斯接到一张奇怪的字条：
#   ```
#   我们约会吧！
#   3485djDkxh4hhGE
#   2984akDfkkkkggEdsb
#   s&hgsfdk
#   d&Hyscvnm
#   ```
#   大侦探很快就明白了，字条上奇怪的乱码实际上就是约会的时间`星期四 14:04`，因为前面两字符串中第 1 对相同的大写英文字母（大小写有区分）是第 4 个字母 `D`，代表星期四；第 2 对相同的字符是 `E` ，那是第 5 个英文字母，代表一天里的第 14 个钟头（于是一天的 0 点到 23 点由数字 0 到 9、以及大写字母 `A` 到 `N` 表示）；后面两字符串第 1 对相同的英文字母 `s` 出现在第 4 个位置（从 0 开始计数）上，代表第 4 分钟。现给定两对字符串，请帮助福尔摩斯解码得到约会的时间。
#
# 实现原理：
#   按特定规则在两个字符串中查找日期信息；依次确定星期、小时、分钟；处理字符的大小写和范围限制
#

DAYS = %w[MON TUE WED THU FRI SAT SUN].freeze

if __FILE__ == $PROGRAM_NAME
  s1 = gets(chomp: true)
  s2 = gets(chomp: true)
  s3 = gets(chomp: true)
  s4 = gets(chomp: true)

  day = nil
  hour = nil
  limit = [s1.length, s2.length].min
  (0...limit).each do |i|
    c1 = s1[i]
    c2 = s2[i]
    next unless c1 == c2

    if day.nil?
      # 第 1 对相同的大写字母 A-G → 星期
      if c1 >= 'A' && c1 <= 'G'
        day = DAYS[c1.ord - 'A'.ord]
        next
      end
    elsif hour.nil?
      # 第 2 对相同字符，且为 0-9 或 A-N → 小时
      if c1 >= '0' && c1 <= '9'
        hour = c1.to_i
        break
      elsif c1 >= 'A' && c1 <= 'N'
        hour = c1.ord - 'A'.ord + 10
        break
      end
    end
  end

  minute = nil
  limit34 = [s3.length, s4.length].min
  (0...limit34).each do |i|
    if s3[i] == s4[i] && s3[i] =~ /[A-Za-z]/
      minute = i
      break
    end
  end

  printf "%s %02d:%02d\n", day, hour, minute
end
