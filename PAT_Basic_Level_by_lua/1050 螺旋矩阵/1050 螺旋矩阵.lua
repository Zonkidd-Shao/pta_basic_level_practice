-- 题目编号: 1050 螺旋矩阵
-- 实现原理: 将数据降序排列，用 top/bottom/left/right 四个指针控制填充边界，按"向右→向下→向左→向上"的螺旋顺序将元素依次填入矩阵，每填完一行或一列后收缩对应边界。

-- 输入只有元素总数，选择行数不小于列数且尽量接近的矩阵
local total = io.read("*n")
local n, m = 1, total
local best_difference = total - 1
for columns = 1, math.floor(math.sqrt(total)) do
    if total % columns == 0 then
        local rows = total / columns
        if rows >= columns and rows - columns < best_difference then
            n, m = rows, columns
            best_difference = rows - columns
        end
    end
end

-- 读取 n*m 个元素并按降序排列
local a = {}
for i = 1, total do a[i] = io.read("*n") end
table.sort(a, function(x, y) return x > y end)

-- grid: 二维矩阵，初始化为空表
-- top, bottom: 上下边界
-- left, right: 左右边界
-- index: 当前要填充的元素索引
local grid = {}
local top, bottom, left, right = 1, n, 1, m
local index = 1

-- 初始化矩阵的每一行
for i = 1, n do grid[i] = {} end

-- 螺旋填充矩阵，按右、下、左、上的顺序循环填充
while top <= bottom and left <= right do
    -- 从左到右填充顶部行
    for j = left, right do
        grid[top][j] = a[index]
        index = index + 1
    end
    top = top + 1  -- 顶部边界向下收缩
    
    -- 从上到下填充右侧列
    for i = top, bottom do
        grid[i][right] = a[index]
        index = index + 1
    end
    right = right - 1  -- 右侧边界向左收缩
    
    -- 如果还有行，从右到左填充底部行
    if top <= bottom then
        for j = right, left, -1 do
            grid[bottom][j] = a[index]
            index = index + 1
        end
        bottom = bottom - 1  -- 底部边界向上收缩
    end
    
    -- 如果还有列，从下到上填充左侧列
    if left <= right then
        for i = bottom, top, -1 do
            grid[i][left] = a[index]
            index = index + 1
        end
        left = left + 1  -- 左侧边界向右收缩
    end
end

-- 按行输出矩阵
for i = 1, n do
    print(table.concat(grid[i], " "))
end
