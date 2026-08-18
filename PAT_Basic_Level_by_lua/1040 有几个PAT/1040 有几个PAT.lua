-- 题目编号: 1040 有几个PAT
-- 实现原理: 遍历字符串，动态维护三个计数器：p 统计已出现的'P'个数，pa 统计可能形成的"PA"组合数（每遇到'A'加上当前p值），pat 统计"PAT"组合数（每遇到'T'加上当前pa值），最终结果对1000000007取模。

-- 读取输入字符串 s，mod 为取模的模数（防止结果溢出）
local s, mod = io.read("l"), 1000000007

-- p: 已出现的 'P' 的个数
-- pa: 已形成的 "PA" 组合的个数
-- pat: 已形成的 "PAT" 组合的个数
local p, pa, pat = 0, 0, 0

-- 遍历字符串的每个字符
for ch in s:gmatch(".") do
    if ch == "P" then
        -- 遇到 'P'，P 的计数加 1
        p = p + 1
    elseif ch == "A" then
        -- 遇到 'A'，可以和之前所有的 'P' 组成 "PA"
        -- 所以 pa 的增量等于当前 p 的值
        pa = (pa + p) % mod
    elseif ch == "T" then
        -- 遇到 'T'，可以和之前所有的 "PA" 组成 "PAT"
        -- 所以 pat 的增量等于当前 pa 的值
        pat = (pat + pa) % mod
    end
end

-- 输出最终的 PAT 组合数
print(pat)
