-- 题目编号: 1035 插入与归并
-- 实现原理: 先找已排序前缀判断是否为插入排序（未排序部分与原序列相同）；若是则执行下一步插入。否则为归并排序，模拟归并过程找到与当前状态匹配的步长，再执行下一步归并后输出。

-- 读取序列长度 n
local n = tonumber(io.read())

-- original: 原始序列，current: 当前序列（某排序算法的中间结果）
local original, current = {}, {}
for i = 1, n do original[i] = io.read("*n") end
for i = 1, n do current[i] = io.read("*n") end

-- 找到已排序前缀的长度 split（前 split 个元素是递增的）
local split = 1
while split < n and current[split] <= current[split + 1] do
    split = split + 1
end

-- 判断是否为插入排序：未排序部分（split+1 到 n）应与原序列完全相同
local insertion = true
for i = split + 1, n do
    if current[i] ~= original[i] then
        insertion = false
        break
    end
end

if insertion then
    -- 插入排序：执行下一步插入
    print("Insertion Sort")
    -- 取前 split+1 个元素排序（相当于把第 split+1 个元素插入到已排序前缀中）
    local prefix = {}
    for i = 1, math.min(split + 1, n) do
        prefix[i] = current[i]
    end
    table.sort(prefix)
    -- 将排序后的前缀写回 current
    for i = 1, #prefix do
        current[i] = prefix[i]
    end
else
    -- 归并排序：找到当前归并步长，再执行下一步
    print("Merge Sort")
    
    -- 判断两个数组是否完全相同
    local function same(a, b)
        for i = 1, n do
            if a[i] ~= b[i] then return false end
        end
        return true
    end
    
    -- 从原始序列开始模拟归并排序，找到匹配当前状态的步长
    local size, work = 1, {}
    for i = 1, n do work[i] = original[i] end
    
    -- 不断加倍步长进行归并，直到与 current 匹配
    repeat
        size = size * 2
        -- 按当前步长 size 进行归并（每 size 个元素为一组，组内排序）
        for start = 1, n, size do
            local stop = math.min(start + size - 1, n)
            local part = {}
            for i = start, stop do
                part[#part + 1] = work[i]
            end
            table.sort(part)
            for i = start, stop do
                work[i] = part[i - start + 1]
            end
        end
    until same(work, current)
    
    -- 再执行一步归并（下一步排序结果）
    size = size * 2
    for start = 1, n, size do
        local stop = math.min(start + size - 1, n)
        local part = {}
        for i = start, stop do
            part[#part + 1] = work[i]
        end
        table.sort(part)
        for i = start, stop do
            work[i] = part[i - start + 1]
        end
    end
    current = work
end

-- 输出最终序列
print(table.concat(current, " "))
