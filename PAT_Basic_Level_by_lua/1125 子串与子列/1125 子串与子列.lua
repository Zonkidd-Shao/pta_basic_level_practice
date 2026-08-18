-- 题目编号: 1125 子串与子列
-- 实现原理: 在字符串s中寻找包含子列p（不要求连续）的最短子串。从每个位置开始，先向右匹配p找到右边界，再向左匹配p找到左边界，记录最短子串的起止位置。

local s, p = io.read("l"), io.read("l")  -- s是原字符串，p是子序列
local best = #s + 1                       -- 最短子串长度，初始化为一个较大值
local l, r = 1, #s                        -- 最短子串的左右边界
local i = 1                               -- 当前枚举的左起点

-- 枚举每个可能的起始位置
while i <= #s do
    local j = 1  -- 当前匹配到p的第几位
    
    -- 第一步：从i开始向右遍历s，匹配p的所有字符，找到右边界
    while i <= #s and j <= #p do
        if s:sub(i, i) == p:sub(j, j) then
            j = j + 1  -- 匹配成功，移动p的指针
        end
        i = i + 1      -- 始终移动s的指针
    end
    
    -- 如果没匹配完p，说明后面没有解了，退出循环
    if j <= #p then break end
    
    local right = i - 1  -- 右边界（最后一个匹配字符的位置）
    
    -- 第二步：从右边界向左回退，重新匹配p（从后往前），找到更紧的左边界
    j = #p
    i = right
    while j >= 1 do
        if s:sub(i, i) == p:sub(j, j) then
            j = j - 1  -- 匹配成功，移动p的指针（向左）
        end
        i = i - 1      -- 始终移动s的指针（向左）
    end
    
    local left = i + 1  -- 左边界（第一个匹配字符的位置）
    
    -- 更新最短子串
    if right - left + 1 < best then
        best = right - left + 1
        l = left
        r = right
    end
    
    -- 下一次从左边界的下一个位置开始枚举
    i = left + 1
end

print(s:sub(l, r))  -- 输出最短子串
