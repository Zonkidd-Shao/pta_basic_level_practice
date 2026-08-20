-- 题目编号: 1067 试密码
-- 实现原理: 模拟密码尝试过程。先读取正确密码和允许尝试次数 n，然后逐行读取用户输入，若输入为"#"则终止；若匹配则输出"Welcome in"并退出；否则输出错误提示。当第 n 次错误时额外输出"Account locked"。
-- pass: 正确密码，n: 允许尝试次数
local pass, n = io.read("l"):match("^(%S+)%s+(%d+)$")
n = tonumber(n)
-- 逐次尝试
for i = 1, n do
    local s = io.read("l")  -- 读取用户输入
    if s == "#" then
        break  -- 输入#终止程序
    end
    if s == pass then
        print("Welcome in")  -- 密码正确
        break
    else
        print("Wrong password: " .. s)  -- 密码错误
    end
    -- 第n次错误后输出账号锁定
    if i == n then
        print("Account locked")
    end
end
