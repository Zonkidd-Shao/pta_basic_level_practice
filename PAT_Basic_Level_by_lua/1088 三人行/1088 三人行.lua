-- 题目编号: 1088 三人行
-- 实现原理: 从99向下枚举两位数甲(i)，通过数位交换得到乙(j)=十位和个位互换。利用丙=j/y以及甲-乙=丙*x的关系验证是否满足条件。找到解后与给定的M比较输出"Cong"/"Ping"/"Gai"。
local m, x, y = io.read("*n"), io.read("*n"), io.read("*n")  -- m:甲的能力值，x,y:比例系数
local a, b, c  -- a:甲，b:乙，c:丙

-- 从99向下枚举两位数的甲（保证找到的第一个解是甲最大的）
for i = 99, 10, -1 do
    -- 乙是甲的十位和个位数字交换
    local j = (i % 10) * 10 + math.floor(i / 10)
    -- 验证条件：
    -- 1. 乙能被y整除（丙必须是整数）
    -- 2. 甲-乙的绝对值 等于 丙*x（即 甲-乙 = j/y * x）
    if j % y == 0 and math.abs(i - j) == j / y * x then
        a, b, c = i, j, j / y  -- 记录甲乙丙的值
        break  -- 找到解后跳出循环
    end
end

-- 没有找到解
if not a then
    print("No Solution")
else
    -- 比较函数：v大于m输出Cong，等于输出Ping，小于输出Gai
    local function r(v)
        return v > m and "Cong" or v == m and "Ping" or "Gai"
    end
    -- 输出甲的值，以及甲乙丙分别与甲的比较结果
    print(a .. " " .. r(a) .. " " .. r(b) .. " " .. r(c))
end
