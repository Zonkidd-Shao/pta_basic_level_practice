-- 题目编号: 1001 害死人不偿命的(3n+1)猜想
-- 实现原理: 从输入的整数n开始循环，若n为偶数则除以2，若为奇数则取(3n+1)/2，直到n=1，统计循环步数并输出。

-- 读取输入的整数n
local n = tonumber(io.read())
-- 计数器：记录从n变到1所需的步数
local steps = 0

-- 循环执行，直到n等于1时停止
while n ~= 1 do
    -- 判断n的奇偶性
    if n % 2 == 0 then
        -- 偶数：直接除以2，使用math.floor向下取整确保结果为整数
        n = math.floor(n / 2)
    else
        -- 奇数：执行(3n+1)/2，相当于一步完成"3n+1"和随后的除以2
        n = math.floor((3 * n + 1) / 2)
    end
    -- 每完成一次变换，步数加1
    steps = steps + 1
end

-- 输出最终步数
print(steps)
