# 1081 检查密码
#
# 题目描述：
#   本题要求你帮助某网站的用户注册模块写一个密码合法性检查的小功能。该网站要求用户设置的密码必须由不少于6个字符组成，并且只能有英文字母、数字和小数点 `.`，还必须既有字母也有数字。
#
# 实现原理：
#   验证密码是否符合安全要求；检查密码长度、字符种类等条件；输出每个密码的检查结果
#

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  n.times do
    pwd = gets(chomp: true)
    if pwd.length < 6
      puts 'Your password is tai duan le.'
    elsif pwd =~ /[^a-zA-Z0-9]/
      puts 'Your password contains characters that are not alphanumeric.'
    elsif pwd !~ /\d/
      puts 'Your password needs a number.'
    elsif pwd !~ /[a-zA-Z]/
      puts 'Your password needs a letter.'
    else
      puts 'Your password is wan mei.'
    end
  end
end
