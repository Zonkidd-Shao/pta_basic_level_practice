use strict;
use warnings;

# =====================================================================
# 题目：1073 多选题常见计分法
# 难度：较难
# 知识点：集合, 模拟, 计数
# =====================================================================
#
# 【题目描述】
#   批改多选题：答案全对得满分；选了部分正确选项且没有错选得一半分；
#   有错选不得分。输出每个学生得分（1 位小数），
#   并统计每题各选项的错误次数，输出错得最多的"题目编号-选项"。
#
# 【实现原理】
#   1. 记录每题的满分和正确选项集合。
#   2. 解析学生答案，按规则计分；凡选项选择情况与标准答案不同
#      （漏选或错选）都计入该选项的错误次数。
#   3. 输出得分，再输出错误次数最多的选项，并列按题号、选项号升序。
#
# 【输入样例】
#   3 4
#   3 4 2 a c
#   2 5 1 b
#   5 3 2 b c
#   1 5 4 a b d e
#   (2 a c) (3 b d e) (2 a c) (3 a b e)
#   (2 a c) (1 b) (2 a b) (4 a b d e)
#   (2 b d) (1 e) (1 c) (4 a b c d)
# 【输出样例】
#   3.5
#   6.0
#   2.5
#   2 2-e
#   2 3-a
#   2 3-b
# =====================================================================

my $line = <STDIN>;
chomp $line;
my ($n, $m) = split /\s+/, $line;

my @full;
my @ans;
for my $i (0 .. $m-1) {
    my $l = <STDIN>;
    chomp $l;
    my @f = split /\s+/, $l;
    my $score = shift @f;
    shift @f;                       # 选项个数（用不到）
    my $cnt = shift @f;             # 正确选项个数
    my %set = map { $_ => 1 } @f;
    $full[$i] = $score;
    $ans[$i]  = \%set;
}

# 每题 a-e 5 个选项的错误次数
my @err = map { [ (0) x 5 ] } 1 .. $m;

for my $s (1 .. $n) {
    my $l = <STDIN>;
    chomp $l;
    my $score = 0;
    my $qi = 0;
    while ($l =~ /\(([^)]*)\)/g) {
        my @sel = split /\s+/, $1;
        shift @sel;                 # 去掉选中的个数
        my %sel = map { $_ => 1 } @sel;
        my %cor = %{$ans[$qi]};

        my $exact     = 1;
        my $has_wrong = 0;
        for my $opt ('a' .. 'e') {
            my $sel_it = $sel{$opt} ? 1 : 0;
            my $cor_it = $cor{$opt} ? 1 : 0;
            if ($sel_it != $cor_it) {
                $exact = 0;
                $err[$qi][ord($opt) - ord('a')]++;
                $has_wrong = 1 if $sel_it;   # 错选了不正确的选项
            }
        }

        if ($exact) {
            $score += $full[$qi];            # 全对得满分
        } elsif (!$has_wrong) {
            $score += $full[$qi] / 2;        # 只漏选无错选得一半
        }
        $qi++;
    }
    printf "%.1f\n", $score;
}

my $best = 0;
for my $i (0 .. $m-1) {
    for my $j (0 .. 4) {
        $best = $err[$i][$j] if $err[$i][$j] > $best;
    }
}

if ($best == 0) {
    print "Too simple\n";
} else {
    for my $i (0 .. $m-1) {
        for my $j (0 .. 4) {
            if ($err[$i][$j] == $best) {
                print "$best ", $i + 1, "-", chr(ord('a') + $j), "\n";
            }
        }
    }
}