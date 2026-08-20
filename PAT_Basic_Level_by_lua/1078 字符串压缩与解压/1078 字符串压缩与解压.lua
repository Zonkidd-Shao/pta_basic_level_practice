-- 题目编号: 1078 字符串压缩与解压
-- 实现原理: 压缩模式：遍历字符串，统计连续相同字符的个数，个数大于1时加数字前缀；解压模式：读取数字和字符对，将字符重复数字次展开。
local mode, s = io.read("l"), io.read("l")  -- mode=C压缩，mode=D解压；s为输入字符串

-- 压缩模式
if mode == "C" then
    local o = {}  -- 存储压缩后的各段结果
    local i = 1  -- 当前位置指针
    -- 遍历整个字符串
    while i <= #s do
        local j = i  -- 从当前位置开始向后查找连续相同字符
        -- 找到连续相同字符的结束位置
        while j <= #s and s:sub(j, j) == s:sub(i, i) do
            j = j + 1
        end
        -- 个数大于1时输出数字+字符，否则只输出字符
        o[#o + 1] = (j - i > 1 and j - i or "") .. s:sub(i, i)
        i = j  -- 移动到下一个不同字符的位置
    end
    print(table.concat(o))  -- 拼接输出压缩结果
else
    -- 解压模式
    local o = {}  -- 存储解压后的各段结果
    local num = ""  -- 累积读取的数字字符串
    -- 逐个字符遍历
    for c in s:gmatch(".") do
        -- 如果是数字，累积到num中
        if c:match("%d") then
            num = num .. c
        else
            -- 遇到非数字字符，将字符重复num次（num为空则重复1次）
            o[#o + 1] = string.rep(c, tonumber(num) or 1)
            num = ""  -- 重置数字累积器
        end
    end
    print(table.concat(o))  -- 拼接输出解压结果
end
