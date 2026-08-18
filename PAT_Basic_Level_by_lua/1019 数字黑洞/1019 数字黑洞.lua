-- 题目编号: 1019 数字黑洞
-- 实现原理: 将数字补足4位后，各位数字按降序排列得大数、按升序排列得小数，相减得到新数，循环该过程直到结果为6174或0，每次输出中间步骤

-- 读取输入的正整数n
local n = tonumber(io.read())

-- 辅助函数：将数字x的各位数字排序后组成新数
-- descending为true时降序排列（得到大数），为false时升序排列（得到小数）
local function order_number(x, descending)
    -- 将数字格式化为4位字符串，不足前面补0
    local digits = string.format("%04d", x)
    -- 存储每一位数字的数组
    local list = {}
    for ch in digits:gmatch("%d") do
        list[#list + 1] = ch
    end
    -- 按指定顺序排序
    table.sort(list, function(a, b)
        return descending and a > b or not descending and a < b
    end)
    -- 拼接成数字返回
    return tonumber(table.concat(list))
end

-- 特殊情况：如果输入就是6174，直接输出一次计算过程
if n == 6174 then
    print("7641 - 1467 = 6174")
else
    -- 重复执行，直到得到6174（卡布列克常数）或0
    repeat
        -- 得到降序排列的大数和升序排列的小数
        local high, low = order_number(n, true), order_number(n, false)
        -- 相减得到新数
        n = high - low
        -- 输出当前步骤（都格式化为4位）
        print(string.format("%04d - %04d = %04d", high, low, n))
    until n == 6174 or n == 0
end
