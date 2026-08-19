use strict;
use warnings;

# =====================================================================
# 题目：1115 裁判机
# 难度：较难
# 知识点：集合去重, 模拟, 排序
# =====================================================================
#
# 【题目描述】
#   数字游戏：裁判给出两个初始正整数，之后每人轮流给出正整数，
#   要求该数必须是已出现某两数之差，且不能等于已出现的数。
#   违规者出局，输出出局轮次及最后赢家。
#
# 【实现原理】
#   1. 维护已出现数字集合 seen，随每次合法输入即时更新。
#   2. 轮到某人时，用当前 seen 两两之差生成合法集合 valid 判断。
#   3. 数字重复或不在 valid 中则出局，否则加入 seen 供后续判断。
#   4. 最后按存活的玩家编号输出赢家。
#
# 【输入样例】
#   101 42
#   4 5
#   ...
# 【输出样例】
#   Round #4: 1 is out.
#   ...
#   Winner(s): 2 4
# =====================================================================

# 读取裁判给出的两个初始正整数
my ($x, $y) = split /\s+/, <STDIN>;
# 读取人数 N 和轮次数 M
my ($n, $m) = split /\s+/, <STDIN>;

# 每人每轮给出的数字
my @a;
for (1 .. $n) {
    my @row = split /\s+/, <STDIN>;
    push @a, \@row;
}

# 已出现数字集合
my %seen = ($x => 1, $y => 1);
# 存活的玩家编号
my %alive;
$alive{$_} = 1 for 1 .. $n;

for my $r (0 .. $m - 1) {
    my @out;
    # 按编号增序检查存活玩家
    for my $i (sort { $a <=> $b } keys %alive) {
        my $z = $a[$i - 1][$r];
        # 用当前 seen 两两之差生成合法集合
        my %valid;
        my @keys = keys %seen;
        for my $u (@keys) {
            for my $v (@keys) {
                next if $u == $v;
                $valid{abs($u - $v)} = 1;
            }
        }
        # 数字重复或不在合法集合中则出局
        if ($seen{$z} || !$valid{$z}) {
            push @out, $i;
        }
        else {
            $seen{$z} = 1;
        }
    }
    # 输出本轮出局者
    for my $i (sort { $a <=> $b } @out) {
        delete $alive{$i};
        print "Round #", $r + 1, ": $i is out.\n";
    }
}

# 输出赢家
if (%alive) {
    my @w = sort { $a <=> $b } keys %alive;
    print "Winner(s): ", join(' ', @w), "\n";
}
else {
    print "No winner.\n";
}
