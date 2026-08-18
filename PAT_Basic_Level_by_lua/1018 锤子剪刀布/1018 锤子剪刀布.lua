-- 题目编号: 1018 锤子剪刀布
-- 实现原理: 利用胜负映射表（C胜J、J胜B、B胜C）统计双方胜、平、负次数，同时记录双方获胜时出的手势，最后找出胜率最高的手势输出

-- 读取比赛回合数
local n = tonumber(io.read())

-- 胜负关系映射表：wins[a] == b 表示a能赢b
-- C（锤子）胜 J（剪刀），J（剪刀）胜 B（布），B（布）胜 C（锤子）
local wins = { C = "J", J = "B", B = "C" }

-- 甲胜次数、乙胜次数、平局次数
local a_win, b_win, draws = 0, 0, 0

-- 甲、乙获胜时分别出的各手势次数
local a_choice, b_choice = { B = 0, C = 0, J = 0 }, { B = 0, C = 0, J = 0 }

-- 遍历每一回合
for _ = 1, n do
    -- 读取甲乙双方的手势
    local a, b = io.read("l"):match("^(%a)%s+(%a)$")
    
    -- 两人出相同手势，平局
    if a == b then
        draws = draws + 1
    -- 甲赢（wins[a] == b 表示a能赢b）
    elseif wins[a] == b then
        a_win = a_win + 1
        a_choice[a] = a_choice[a] + 1
    -- 乙赢
    else
        b_win = b_win + 1
        b_choice[b] = b_choice[b] + 1
    end
end

-- 辅助函数：找出获胜次数最多的手势（如果并列，按字母顺序最小的输出）
local function favorite(count)
    -- 初始假设B最多（按字母顺序B < C < J，所以先从B开始比较）
    local best = "B"
    -- 依次比较C和J
    for _, choice in ipairs({ "C", "J" }) do
        -- 如果当前手势获胜次数更多，则更新
        if count[choice] > count[best] then
            best = choice
        end
    end
    return best
end

-- 第一行输出：甲胜、平、负次数（甲负 = 乙胜）
print(a_win .. " " .. draws .. " " .. b_win)
-- 第二行输出：乙胜、平、负次数（乙负 = 甲胜）
print(b_win .. " " .. draws .. " " .. a_win)
-- 第三行输出：甲和乙各自获胜最多的手势
print(favorite(a_choice) .. " " .. favorite(b_choice))
