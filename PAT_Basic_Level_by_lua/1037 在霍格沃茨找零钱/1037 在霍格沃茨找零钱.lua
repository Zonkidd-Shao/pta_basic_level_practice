-- 题目编号: 1037 在霍格沃茨找零钱
-- 实现原理: 将 Galleon.Sickle.Knut 格式的货币统一换算为最小单位 Knut 进行计算，求出应付与实付的差值，再转换回原格式输出，注意负数处理。

-- 读取货币（格式：Galleon.Sickle.Knut）并转换为最小单位 Knut
-- 换算关系：1 Galleon = 17 Sickle = 17*29 Knut
local function read_money(text)
    local g, s, k = text:match("^(%d+)%.(%d+)%.(%d+)$")
    return tonumber(g) * 17 * 29 + tonumber(s) * 29 + tonumber(k)
end

-- 读取应付价格 price 和实付金额 paid（都转换为 Knut）
local price_text, paid_text = io.read("l"):match("^(%S+)%s+(%S+)$")
local price, paid = read_money(price_text), read_money(paid_text)

-- 计算找零差值，以及符号标记
local difference, sign = paid - price, ""

-- 如果差值为负，记录负号并取绝对值
if difference < 0 then
    sign, difference = "-", -difference
end

-- 将 Knut 转换回 Galleon.Sickle.Knut 格式
-- 先算 Galleon
local g = math.floor(difference / (17 * 29))
difference = difference % (17 * 29)
-- 再算 Sickle 和 Knut
print(sign .. g .. "." .. math.floor(difference / 29) .. "." .. difference % 29)
