-- 题目编号: 1102 教超冠军卷
-- 实现原理: 遍历每条商品记录（商品ID、价格、销量），记录销量最高的商品（a）和销售额（价格×销量）最高的商品（b），最后分别输出。
local n = tonumber(io.read())  -- 读取商品数量
local a, b                     -- a记录销量最高的商品，b记录销售额最高的商品

-- 遍历每条商品记录
for i = 1, n do
    -- 解析商品ID、价格、销量
    local id, p, c = io.read("l"):match("^(%S+)%s+(%d+)%s+(%d+)$")
    p, c = tonumber(p), tonumber(c)
    
    -- 更新销量最高的商品
    if not a or c > a[2] then
        a = {id, c}
    end
    
    -- 更新销售额最高的商品（销售额 = 价格 × 销量）
    if not b or p * c > b[2] then
        b = {id, p * c}
    end
end

print(a[1] .. " " .. a[2])  -- 输出销量冠军：商品ID和销量
print(b[1] .. " " .. b[2])  -- 输出销售额冠军：商品ID和销售额
