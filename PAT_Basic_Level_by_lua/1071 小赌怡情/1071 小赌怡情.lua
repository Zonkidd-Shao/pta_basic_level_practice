-- 题目编号: 1071 小赌怡情
-- 实现原理: 模拟赌博游戏过程，每轮读取玩家下注和猜的大小结果，判断玩家是否猜对并更新筹码。若筹码归零则游戏结束。
-- money: 初始筹码，n: 游戏轮数
local money, n = io.read("*n"), io.read("*n")
-- 逐轮游戏
for i = 1, n do
    -- 输入顺序为 n1、猜测方向、下注数、n2
    local a, bet, c, d = io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n")
    if c > money then
        -- 筹码不足，无法下注
        print("Not enough tokens.  Total = " .. money .. ".")
    elseif (d > a) == (bet == 1) then
        -- 猜对了：a>b且猜大，或a<=b且猜小（即猜大不成立）
        money = money + c
        print("Win " .. c .. "!  Total = " .. money .. ".")
    else
        -- 猜错了
        money = money - c
        print("Lose " .. c .. ".  Total = " .. money .. ".")
    end
    -- 筹码归零，游戏结束
    if money == 0 then
        print("Game Over.")
        break
    end
end
