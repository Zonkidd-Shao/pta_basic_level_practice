import sys
from collections import defaultdict

data = sys.stdin.read().strip().split()
if not data:
    sys.exit(0)
it = iter(data)
n = int(next(it)); m = int(next(it))
records = []
for _ in range(n):
    try:
        ticket = next(it); score = int(next(it))
    except StopIteration:
        break
    records.append((ticket, score))

out_lines = []
for q in range(1, m+1):
    try:
        t = next(it); x = next(it)
    except StopIteration:
        break
    out_lines.append(f"Case {q}: {t} {x}")
    if t == '1':
        filtered = [(tick, sc) for tick, sc in records if tick[0] == x]
        if not filtered:
            out_lines.append("NA")
        else:
            filtered.sort(key=lambda y: (-y[1], y[0]))
            for tick, sc in filtered:
                out_lines.append(f"{tick} {sc}")
    elif t == '2':
        cnt = 0; total = 0
        for tick, sc in records:
            if tick[1:4] == x:
                cnt += 1; total += sc
        if cnt == 0:
            out_lines.append("NA")
        else:
            out_lines.append(f"{cnt} {total}")
    else:  # t == '3'
        room_cnt = defaultdict(int)
        for tick, sc in records:
            if tick[4:10] == x:
                room_cnt[tick[1:4]] += 1
        if not room_cnt:
            out_lines.append("NA")
        else:
            sorted_rooms = sorted(room_cnt.items(), key=lambda kv: (-kv[1], kv[0]))
            for room, c in sorted_rooms:
                out_lines.append(f"{room} {c}")
sys.stdout.write("\n".join(out_lines))
