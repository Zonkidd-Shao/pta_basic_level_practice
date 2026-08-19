# 1067 试密码
#
# 题目描述：
#   当你试图登录某个系统却忘了密码时，系统一般只会允许你尝试有限多次，当超出允许次数时，账号就会被锁死。本题就请你实现这个小功能。
#
# 实现原理：
#   逐次尝试输入的密码；与正确密码比较判断是否正确；处理尝试次数限制和锁定情况
#

if __FILE__ == $PROGRAM_NAME
  line = gets(chomp: true)
  parts = line.split
  attempts_allowed = parts.pop.to_i
  password = parts.join(' ')

  attempts_allowed.times do
    attempt = gets(chomp: true)
    if attempt == '#'
      exit
    elsif attempt == password
      puts 'Welcome in'
      exit
    else
      puts "Wrong password: #{attempt}"
    end
  end
  puts 'Account locked'
end
