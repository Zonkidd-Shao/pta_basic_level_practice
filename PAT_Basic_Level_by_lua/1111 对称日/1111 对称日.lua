-- 题目编号: 1111 对称日
-- 实现原理: 将月份英文缩写映射为数字，将日期格式化为YYYYMMDD字符串，检查该字符串是否与其反转相等（即回文），输出结果。

-- 月份英文缩写到数字的映射表
local m = {
    Jan = "01", Feb = "02", Mar = "03", Apr = "04", May = "05", Jun = "06",
    Jul = "07", Aug = "08", Sep = "09", Oct = "10", Nov = "11", Dec = "12"
}

local n = tonumber(io.read())  -- 读取测试用例数量

-- 处理每个测试用例
for i = 1, n do
    -- 解析月份、日期、年份
    local mon, d, y = io.read("l"):match("^(%a+)%s+(%d+),%s+(%d+)$")
    -- 格式化为YYYYMMDD的字符串
    local s = string.format("%04d", tonumber(y)) .. m[mon] .. string.format("%02d", tonumber(d))
    -- 判断是否为回文字符串，输出结果
    print((s == s:reverse() and "Y " or "N ") .. s)
end
