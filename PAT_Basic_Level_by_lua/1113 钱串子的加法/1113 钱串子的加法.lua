-- 题目编号: 1113 钱串子的加法
-- 实现原理: 自定义30进制数字（0-9和a-t），从低位到高位逐位相加，处理进位，最后反转结果并去除前导零输出。

local a, b = io.read("l"):match("^(%S+)%s+(%S+)$")  -- 读取两个30进制数字字符串
local i, j, c = #a, #b, 0                             -- i,j为当前处理位的下标，c为进位
local o = {}                                           -- 存储结果的每一位（逆序）

-- 字符转数值：0-9直接转，a-t对应10-29（a的ASCII码是97，97-87=10）
local function val(x)
    return x:match("%d") and tonumber(x) or string.byte(x) - 87
end

-- 数值转字符：0-9直接转，10-29对应a-t
local function chr(x)
    return x < 10 and tostring(x) or string.char(x + 87)
end

-- 从低位到高位逐位相加，处理进位
while i > 0 or j > 0 or c > 0 do
    -- 取当前位的数值，超出范围则为0
    local x = i > 0 and val(a:sub(i, i)) or 0
    local y = j > 0 and val(b:sub(j, j)) or 0
    -- 当前位相加加上进位
    local z = x + y + c
    -- 当前位结果取模30
    o[#o + 1] = chr(z % 30)
    -- 计算进位
    c = math.floor(z / 30)
    -- 指针左移
    i = i - 1
    j = j - 1
end

-- 结果是逆序的，反转后去除前导零
local s = table.concat(o):reverse():gsub("^0+", "")
-- 如果结果为空（全零），输出0，否则输出结果
print(s == "" and "0" or s)
