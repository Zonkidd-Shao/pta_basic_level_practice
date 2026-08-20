# 1073 多选题常见计分法
import sys
import re

data = sys.stdin.read().strip().splitlines()
if not data:
    sys.exit(0)
N, M = map(int, data[0].split())
score = []
opt_num = []
ans = []
ans_cnt = []
idx = 1
for i in range(M):
    parts = data[idx].split()
    idx += 1
    score.append(int(parts[0]))
    opt_num.append(int(parts[1]))
    cnt = int(parts[2])
    correct = set(parts[3:3+cnt])
    ans.append(correct)
    ans_cnt.append(cnt)

# 准备错误统计
wrong = [[0]*5 for _ in range(M)]

# 辅助：把 a->0, b->1...
def char_to_idx(c): return ord(c) - ord('a')

# 读取学生作答
for stu_idx in range(N):
    # 需要收集包含 M 个括号组的行，可能跨行？
    # 累积直到取得 M 组
    groups = []
    while len(groups) < M and idx < len(data):
        line = data[idx]
        idx += 1
        if not line.strip():
            continue
        groups += re.findall(r'\(([^)]*)\)', line)
    # 如果仍不足，补空
    total = 0.0
    for q in range(M):
        if q < len(groups):
            inner = groups[q].strip()
            parts = inner.split()
            if not parts:
                stu_set = set()
            else:
                try:
                    cnt = int(parts[0])
                    stu_set = set(parts[1:1+cnt]) if cnt>0 else set()
                except:
                    stu_set = set(parts)
        else:
            stu_set = set()
        # 计分和统计
        # 将集合转为 5 位数组比较
        correct_set = ans[q]
        # flag: 选对的正确选项数
        flag = len(stu_set & correct_set)
        # 是否选了错误选项
        has_wrong_select = len(stu_set - correct_set) > 0
        # 统计错误次数：逐选项比较
        for k in range(opt_num[q]):
            ch = chr(ord('a')+k)
            in_correct = ch in correct_set
            in_stu = ch in stu_set
            if in_correct != in_stu:
                wrong[q][k] += 1
        if stu_set == correct_set:
            total += score[q]
        elif not has_wrong_select and flag > 0:
            total += score[q] / 2.0
        # else 0
    # 输出保留一位小数
    print(f"{total:.1f}")

max_wrong = 0
for i in range(M):
    for j in range(opt_num[i]):
        if wrong[i][j] > max_wrong:
            max_wrong = wrong[i][j]
if max_wrong == 0:
    print("Too simple")
else:
    for i in range(M):
        for j in range(opt_num[i]):
            if wrong[i][j] == max_wrong:
                print(f"{max_wrong} {i+1}-{chr(ord('a')+j)}")
