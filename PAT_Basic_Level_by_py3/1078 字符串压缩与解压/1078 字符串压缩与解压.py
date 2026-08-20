import sys

mode = sys.stdin.readline().strip()
# 保留空格：剩余所有行拼接（题目只有一行，但用join兼容）
rest = sys.stdin.read()
if rest is None:
    s = ""
else:
    # splitlines 保留空格，去掉换行符，join 合并
    s = ''.join(rest.splitlines())
    # 若 read() 为空但原输入第二行在同一buffer？fallback：若 s 为空且 rest 包含内容
    # 已经处理

if mode == 'C':
    out = []
    i = 0
    n = len(s)
    while i < n:
        j = i + 1
        while j < n and s[j] == s[i]:
            j += 1
        cnt = j - i
        if cnt > 1:
            out.append(str(cnt))
        out.append(s[i])
        i = j
    sys.stdout.write(''.join(out))
else:  # D
    out = []
    i = 0
    n = len(s)
    while i < n:
        num = 0
        while i < n and s[i].isdigit():
            num = num * 10 + int(s[i])
            i += 1
        if i < n:
            ch = s[i]
            if num == 0:
                out.append(ch)
            else:
                out.append(ch * num)
            i += 1
    sys.stdout.write(''.join(out))
