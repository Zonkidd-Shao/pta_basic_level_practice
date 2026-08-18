-- 题目编号: 1081 检查密码
-- 实现原理: 逐行读取密码字符串，分别检查长度是否>=6、是否只包含字母数字和点、是否包含字母、是否包含数字，按缺失情况输出对应提示信息。
local n = tonumber(io.read())  -- 读取密码数量

-- 逐个检查每个密码
for i = 1, n do
    local s = io.read("l")  -- 读取密码字符串
    local l = #s  -- 密码长度
    local a = s:match("%a")  -- 检查是否包含字母（%a匹配字母）
    local d = s:match("%d")  -- 检查是否包含数字（%d匹配数字）
    local ok = s:match("^[%w%.]+$")  -- 检查是否只包含字母数字和点（%w匹配字母数字，%.匹配点号）
    
    -- 按优先级判断并输出对应提示
    if l < 6 then
        -- 长度不足6位
        print("Your password is tai duan le.")
    elseif not ok then
        -- 包含非法字符
        print("Your password is tai luan le.")
    elseif not a then
        -- 缺少字母
        print("Your password needs zi mu.")
    elseif not d then
        -- 缺少数字
        print("Your password needs shu zi.")
    else
        -- 全部符合要求
        print("Your password is wan mei.")
    end
end
