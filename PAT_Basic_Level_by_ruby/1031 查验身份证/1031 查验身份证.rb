# 1031 查验身份证
#
# 题目描述：
#   一个合法的身份证号码由17位地区、日期编号和顺序编号加1位校验码组成。校验码的计算规则如下：
#   首先对前17位数字加权求和，权重分配为：{7，9，10，5，8，4，2，1，6，3，7，9，10，5，8，4，2}；然后将计算的和对11取模得到值`Z`；最后按照以下关系对应`Z`值与校验码`M`的值：
#   ```
#   Z：0 1 2 3 4 5 6 7 8 9 10
#   M：1 0 X 9 8 7 6 5 4 3 2
#   ```
#   现在给定一些身份证号码，请你验证校验码的有效性，并输出有问题的号码。
#
# 实现原理：
#   验证身份证号码的校验位是否正确；使用加权求和和模运算计算校验码；检查前17位是否全为数字
#

WEIGHTS = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2].freeze
CHECK_CODE = '10X98765432'.freeze

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  invalid = []

  n.times do
    id = gets(chomp: true)
    sum = 0
    valid = true
    (0...17).each do |i|
      if id[i] < '0' || id[i] > '9'
        valid = false
        break
      end
      sum += id[i].to_i * WEIGHTS[i]
    end
    valid = false if valid && CHECK_CODE[sum % 11] != id[17]
    invalid << id unless valid
  end

  if invalid.empty?
    puts 'All passed'
  else
    puts invalid
  end
end
