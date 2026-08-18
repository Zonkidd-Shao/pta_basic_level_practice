-- 题目编号: 1066 图像过滤
-- 实现原理: 遍历图像所有像素，若像素值在指定区间 [a,b] 内则替换为指定值 x，否则保持不变。每个像素值按三位数格式化输出，保持对齐。
-- m: 列数，n: 行数，a和b: 过滤区间，x: 替换值
local m, n, a, b, x = io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n")
-- 逐行处理
for i = 1, n do
    local o = {}  -- 存储该行处理后的像素
    -- 逐列处理
    for j = 1, m do
        local v = io.read("*n")  -- 读取像素值
        -- 在[a,b]区间内则替换为x，否则保持原值
        -- 格式化为三位数字（不足补前导零）
        o[j] = string.format("%03d", v >= a and v <= b and x or v)
    end
    print(table.concat(o, " "))  -- 输出该行
end
