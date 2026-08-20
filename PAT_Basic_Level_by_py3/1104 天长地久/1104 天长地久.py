# 题目：1104 天长地久
#
# 题目描述：
#   “天长地久数”是指一个 K 位正整数 A，其满足条件为：A 的各位数字之和为 m，A+1 的各位数字之和为 n，且 m 与 n 的最大公约数是一个大于 2 的素数。本题就请你找出这些天长地久数。
#
# 输入格式：
#   输入在第一行给出正整数 N（\le 5），随后 N 行，每行给出一对 K（3<K<10）和 m（1<m<90），其含义如题面所述。
#
# 输出格式：
#   对每一对输入的 K 和 m，首先在一行中输出 `Case X`，其中 `X` 是输出的编号（从 1 开始）；然后一行输出对应的 n 和 A，数字间以空格分隔。如果解不唯一，则每组解占一行，按 n 的递增序输出；若仍不唯一，则按 A 的递增序输出。若解不存在，则在一行中输出 `No Solution`。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   逐位处理：将输入字符串逐位转换为数字求和，
#   再将结果转换为对应拼音输出。
#
import math
import sys


def prime(x):
    return x > 2 and all(x % i for i in range(2, math.isqrt(x) + 1))


def has_prefix(length, total):
    """Whether a length-digit prefix can meet the required digit sum."""
    if length <= 0:
        return total == 0
    # The first digit is 1..9 and the last prefix digit must be 0..8;
    # this prevents the number of trailing 9s from being understated.
    return 1 <= total <= 9 * (length - 1) + 8


def prefixes(length, total):
    digits = [0] * length

    def visit(pos, remaining):
        if pos == length:
            if remaining == 0:
                yield ''.join(map(str, digits))
            return

        low = 1 if pos == 0 else 0
        high = 8 if pos == length - 1 else 9
        rest = length - pos - 1
        max_rest = 8 + 9 * (rest - 1) if rest else 0
        for digit in range(low, high + 1):
            left = remaining - digit
            if 0 <= left <= max_rest:
                digits[pos] = digit
                yield from visit(pos + 1, left)

    yield from visit(0, total)


for case in range(1, int(sys.stdin.readline()) + 1):
    k, m = map(int, sys.stdin.readline().split())
    candidates = []

    # If A does not end in 9, digit_sum(A+1) is m+1 and the gcd is 1.
    # Therefore only numbers with at least one trailing 9 can qualify.
    for trailing_nines in range(1, k):
        n = m - 9 * trailing_nines + 1
        if not prime(math.gcd(m, n)):
            continue
        prefix_length = k - trailing_nines
        prefix_sum = m - 9 * trailing_nines
        if has_prefix(prefix_length, prefix_sum):
            candidates.append((n, trailing_nines, prefix_sum))

    print(f'Case {case}')
    if not candidates:
        print('No Solution')
        continue

    suffix_cache = {t: '9' * t for _, t, _ in candidates}
    emitted = False
    for n, trailing_nines, prefix_sum in sorted(candidates):
        for prefix in prefixes(k - trailing_nines, prefix_sum):
            print(n, prefix + suffix_cache[trailing_nines])
            emitted = True
    if not emitted:
        print('No Solution')
