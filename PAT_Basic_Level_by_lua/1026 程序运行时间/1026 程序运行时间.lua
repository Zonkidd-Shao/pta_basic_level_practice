-- 题目编号: 1026 程序运行时间
-- 实现原理: 计算起始和结束时钟数的差值，除以100并四舍五入得到秒数，再将秒数转换为HH:MM:SS格式输出。

-- 读取起始和结束的时钟数（单位：CLK_TCK，每100个单位等于1秒）
local start, finish = io.read("*n"), io.read("*n")

-- 计算总秒数：差值除以100，加0.5后向下取整实现四舍五入
local seconds = math.floor((finish - start) / 100 + 0.5)

-- 格式化输出为 HH:MM:SS 格式
-- 小时 = 总秒数 / 3600
-- 分钟 = (总秒数 / 60) % 60
-- 秒 = 总秒数 % 60
print(string.format("%02d:%02d:%02d", 
    math.floor(seconds / 3600), 
    math.floor(seconds / 60) % 60, 
    seconds % 60))
