-- 题目编号: 1123 舍入
-- 使用字符串完成十进制处理，避免 200 位数字转换为浮点数造成精度丢失。

local n, d = io.read("*n"), io.read("*n")
io.read("l")

local function increment(s)
    local digits, carry = {}, 1
    for i = #s, 1, -1 do
        local value = tonumber(s:sub(i, i)) + carry
        if value == 10 then
            digits[#digits + 1] = "0"
            carry = 1
        else
            digits[#digits + 1] = tostring(value)
            carry = 0
        end
    end
    if carry == 1 then digits[#digits + 1] = "1" end
    local result = {}
    for i = #digits, 1, -1 do result[#result + 1] = digits[i] end
    return table.concat(result)
end

local function any_nonzero(s)
    return s:find("[1-9]", 1) ~= nil
end

for _ = 1, n do
    local mode, text = io.read("l"):match("^(%d)%s+(.+)$")
    local sign, body = "", text
    if body:sub(1, 1) == "-" then
        sign, body = "-", body:sub(2)
    end

    local integer, fraction = body:match("^(%d+)%.(%d+)$")
    if not integer then integer, fraction = body, "" end
    local kept = fraction:sub(1, d) .. string.rep("0", math.max(0, d - #fraction))
    local discarded = fraction:sub(d + 1)
    local first = tonumber(discarded:sub(1, 1)) or 0
    local round_up = false

    if mode == "1" then
        round_up = first >= 5
    elseif mode == "3" then
        if first > 5 then
            round_up = true
        elseif first == 5 then
            if any_nonzero(discarded:sub(2)) then
                round_up = true
            else
                local combined = integer .. kept
                round_up = tonumber(combined:sub(-1)) % 2 == 1
            end
        end
    end

    local combined = integer .. kept
    if round_up then combined = increment(combined) end

    local new_integer, new_fraction
    if d > 0 then
        new_integer = combined:sub(1, #combined - d)
        new_fraction = combined:sub(#combined - d + 1)
    else
        new_integer, new_fraction = combined, ""
    end

    if not any_nonzero(new_integer .. new_fraction) then sign = "" end
    print(sign .. new_integer .. (d > 0 and "." .. new_fraction or ""))
end
