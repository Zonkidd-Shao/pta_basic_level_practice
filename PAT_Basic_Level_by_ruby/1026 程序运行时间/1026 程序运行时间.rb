# 1026 程序运行时间
#
# 题目描述：
#   要获得一个 C 语言程序的运行时间，常用的方法是调用头文件 time.h，其中提供了 clock() 函数，可以捕捉从程序开始运行到 clock() 被调用时所耗费的时间。这个时间单位是 clock tick，即“时钟打点”。同时还有一个常数 CLK_TCK，给出了机器时钟每秒所走的时钟打点数。于是为了获得一个函数 f 的运行时间，我们只要在调用 f 之前先调用 clock()，获得一个时钟打点数 C1；在 f 执行完成后再调用 clock()，获得另一个时钟打点数 C2；两次获得的时钟打点数之差 (C2-C1) 就是 f 运行所消耗的时钟打点数，再除以常数 CLK_TCK，就得到了以秒为单位的运行时间。
#   这里不妨简单假设常数 CLK_TCK 为 100。现给定被测函数前后两次获得的时钟打点数，请你给出被测函数运行的时间。
#
# 实现原理：
#   计算两个时间点的差值；四舍五入到秒；按时分秒格式输出时间差
#

if __FILE__ == $PROGRAM_NAME
  c1, c2 = gets.split.map(&:to_i)
  ticks = c2 - c1
  # 四舍五入到秒（整数运算，ticks 恒为正）
  total_seconds = (ticks + 50) / 100

  hours = total_seconds / 3600
  minutes = (total_seconds % 3600) / 60
  seconds = total_seconds % 60
  printf "%02d:%02d:%02d\n", hours, minutes, seconds
end
