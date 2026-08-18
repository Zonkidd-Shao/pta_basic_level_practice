-- 题目编号: 1020 月饼
-- 实现原理: 计算每种月饼的单价（售价/库存），按单价降序排序，贪心策略优先出售单价最高的月饼，直至满足市场需求，计算总收益并保留两位小数输出

-- 读取月饼种类数n和市场最大需求量demand
local n, demand = io.read("*n"), io.read("*n")

-- 存储每种月饼的库存量和总售价
local stock, price = {}, {}
-- 读取每种月饼的库存量
for i = 1, n do
    stock[i] = io.read("*n")
end
-- 读取每种月饼的总售价
for i = 1, n do
    price[i] = io.read("*n")
end

-- 构建月饼信息数组，包含库存、售价和单价
local cakes = {}
for i = 1, n do
    cakes[i] = {
        stock = stock[i],
        price = price[i],
        unit = price[i] / stock[i]  -- 单价 = 总售价 / 库存量
    }
end

-- 按单价从高到低排序（贪心策略：优先卖单价高的）
table.sort(cakes, function(a, b) return a.unit > b.unit end)

-- 总收益
local income = 0
-- 依次尝试出售每种月饼
for _, cake in ipairs(cakes) do
    -- 当前能卖出的数量：取需求量和库存量的较小值
    local amount = math.min(demand, cake.stock)
    -- 累加收益
    income = income + amount * cake.unit
    -- 减少剩余需求量
    demand = demand - amount
    -- 需求已满足，提前退出
    if demand == 0 then
        break
    end
end
-- 输出总收益，保留两位小数
print(string.format("%.2f", income))
