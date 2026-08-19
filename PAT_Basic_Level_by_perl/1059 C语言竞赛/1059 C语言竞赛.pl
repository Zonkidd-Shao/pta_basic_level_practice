use strict;
use warnings;

# =====================================================================
# 题目：1059 C语言竞赛
# 难度：中等
# 知识点：素数筛, 哈希表
# =====================================================================
#
# 【题目描述】
#   给定比赛最终排名（按顺序给出一系列参赛者 ID）和若干需要查询的 ID。
#   冠军得 Mystery Award，排名为素数的得 Minion，其余得 Chocolate；
#   不在排名中输出 Are you kidding?，已查询过的输出 Checked。
#
# 【实现原理】
#   1. 用哈希表记录每个 ID 对应的排名（1 为冠军）。
#   2. 用埃氏筛预处理 1..N 的素数表。
#   3. 依次处理查询：先判是否在排名中，再判是否查过，最后按排名给奖。
#
# 【输入样例】
#   6
#   1111
#   6666
#   8888
#   1234
#   5555
#   0001
#   6
#   8888
#   0001
#   1111
#   2222
#   8888
#   2222
# 【输出样例】
#   8888: Minion
#   0001: Chocolate
#   1111: Mystery Award
#   2222: Are you kidding?
#   8888: Checked
#   2222: Are you kidding?
# =====================================================================

my @tok = split /\s+/, join('', <STDIN>);   # 读取全部 token（保留前导零）
my $idx = 0;
my $n = $tok[$idx++];

# 记录每个 ID 的排名（1 为冠军）
my %rank;
for my $r (1 .. $n) {
    $rank{$tok[$idx++]} = $r;
}

my $k = $tok[$idx++];
my @queries = @tok[$idx .. $idx + $k - 1];

# 埃氏筛求 1..N 的素数
my @prime = (1) x ($n + 1);
$prime[0] = $prime[1] = 0;
for my $i (2 .. int(sqrt($n))) {
    next unless $prime[$i];
    for (my $j = $i * $i; $j <= $n; $j += $i) {
        $prime[$j] = 0;
    }
}

my %seen;
for my $id (@queries) {
    if (!exists $rank{$id}) {
        print "$id: Are you kidding?\n";
    } elsif ($seen{$id}) {
        print "$id: Checked\n";
    } else {
        my $r = $rank{$id};
        my $prize = $r == 1 ? "Mystery Award"
                  : $prime[$r] ? "Minion"
                  : "Chocolate";
        print "$id: $prize\n";
        $seen{$id} = 1;
    }
}
