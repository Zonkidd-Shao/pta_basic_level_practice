use strict;
use warnings;

# =====================================================================
# 题目：1104 天长地久
# 难度：较难
# 知识点：数论, 深度优先搜索, 最大公约数, 素数判断
# =====================================================================
#
# 【题目描述】
#   找出所有 K 位正整数 A，满足 A 的各位数字之和为 m，
#   A+1 的各位数字之和为 n，且 gcd(m,n) 是大于 2 的素数。
#   对每组输入，先输出 Case X，再按 n 升序、A 升序输出所有解，
#   无解输出 No Solution。
#
# 【实现原理】
#   1. 关键观察：若 A 的末尾恰好有 t 个连续的 9，则 A+1 会让这
#      t 个 9 全部进位成 0、前面的某一位 +1，
#      于是 n = m - 9*t + 1，且 A = 前缀*10^t + (10^t-1)。
#   2. 枚举 t（0..K-1），得到唯一的 n，检查 gcd(m,n) 是否为素数且 >2。
#   3. 对每个合法的 t，用递归枚举所有"长度 K-t、数位和为 m-9t、
#      末位不为 9"的前缀，前缀按数字升序生成即可保证 A 升序。
#   4. t 从大到小枚举，n 随之升序，满足题目排序要求。
#
# 【输入样例】
#   2
#   6 45
#   7 80
# 【输出样例】
#   Case 1
#   10 189999
#   10 279999
#   10 369999
#   10 459999
#   10 549999
#   10 639999
#   10 729999
#   10 819999
#   10 909999
#   Case 2
#   No Solution
# =====================================================================

# 最大公约数（欧几里得算法）
sub gcd {
    my ($a, $b) = @_;
    ($a, $b) = ($b, $a % $b) while $b;
    return $a;
}

# 素数判断
sub is_prime {
    my $x = shift;
    return 0 if $x < 2;
    return 0 if $x % 2 == 0 && $x != 2;
    for (my $i = 3; $i * $i <= $x; $i += 2) {
        return 0 if $x % $i == 0;
    }
    return 1;
}

my $line = <STDIN>;
chomp $line;
my $n = $line + 0;

for my $case (1 .. $n) {
    my $l = <STDIN>;
    chomp $l;
    my ($k, $m) = split / +/, $l;

    print "Case $case\n";
    my @ans;

    # t 从大到小枚举：n = m-9t+1 随 t 增大而减小，保证 n 升序输出
    for (my $t = $k - 1; $t >= 0; $t--) {
        my $s = $m - 9 * $t;         # 前缀部分（去掉 t 个 9）的数位和
        next if $s < 1;              # 前缀数位和至少为 1，否则换下一个 t
        my $nn = $m - 9 * $t + 1;    # A+1 的数位和
        my $g = gcd($m, $nn);
        next unless is_prime($g) && $g > 2;   # gcd 须为大于 2 的素数

        my $len  = $k - $t;          # 前缀长度
        my $base = 10 ** $t;         # 前缀的权重
        my $nine = $base - 1;        # t 个 9 组成的尾部

        # 递归生成所有 len 位、数位和为 s、末位不为 9 的前缀
        my $gen;
        $gen = sub {
            my ($rem, $pos, $cur, $lastd) = @_;
            if ($pos == $len) {
                return if $lastd == 9;   # 末位为 9 则不止 t 个尾 9
                push @ans, "$nn " . ($cur * $base + $nine);
                return;
            }
            my $left = $len - $pos - 1;  # 剩余待填位数
            my $lo = ($pos == 0) ? 1 : 0; # 首位不能为 0
            $lo = $rem - 9 * $left if $rem - 9 * $left > $lo;
            my $hi = $rem < 9 ? $rem : 9;
            return if $lo > $hi;          # 无可行数字，剪枝
            for my $d ($lo .. $hi) {
                $gen->($rem - $d, $pos + 1, $cur * 10 + $d, $d);
            }
        };
        $gen->($s, 0, 0, 0);
    }

    if (@ans) {
        print join("\n", @ans), "\n";
    } else {
        print "No Solution\n";
    }
}
