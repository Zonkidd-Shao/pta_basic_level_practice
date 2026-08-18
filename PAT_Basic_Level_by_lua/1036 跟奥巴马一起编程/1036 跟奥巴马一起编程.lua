-- 题目编号: 1036 跟奥巴马一起编程
-- 实现原理: 行数 = 列数/2 四舍五入取整。首行和末行输出 n 个字符，中间行输出首字符 + (n-2)个空格 + 尾字符，形成正方形框架。

-- 读取列数 n 和要打印的字符 ch
local n, ch = io.read("*n"), io.read("*l"):match("%S+")

-- 计算行数：列数的一半，四舍五入取整
local rows = math.floor(n / 2 + 0.5)

-- 逐行打印
for i = 1, rows do
    -- 首行和末行：打印 n 个完整字符
    if i == 1 or i == rows then
        print(string.rep(ch, n))
    else
        -- 中间行：首字符 + (n-2)个空格 + 尾字符，形成空心正方形
        print(ch .. string.rep(" ", n - 2) .. ch)
    end
end
