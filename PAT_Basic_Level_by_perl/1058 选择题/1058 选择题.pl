use strict;
use warnings;

# =====================================================================
# 题目：1058 选择题
# 难度：中等
# 知识点：字符串解析, 集合比较
# =====================================================================
#
# 【题目描述】
#   批改多选题。给出每道题的满分和正确选项，以及每个学生的答题情况
#   （格式为 (选中个数 选项...)），统计每个学生的得分，并找出错得最多
#   的题目编号（若有并列按编号递增输出，若无人错则输出 Too simple）。
#
# 【实现原理】
#   1. 读取每道题的满分和正确选项，选项排序后存储。
#   2. 解析每个学生的答题行，用正则提取每题的 (选中个数 选项...)。
#   3. 将学生选项排序后与正确选项比较，全部匹配才得分，否则计错一次。
#   4. 输出每个学生的得分，最后输出错得最多的题目。
#
# 【输入样例】
#   3 4
#   3 4 2 a c
#   2 5 1 b
#   5 3 2 b c
#   1 5 4 a b d e
#   (2 a c) (2 b d) (2 a c) (3 a b e)
#   (2 a c) (1 b) (2 a b) (4 a b d e)
#   (2 b d) (1 e) (2 b c) (4 a b c d)
# 【输出样例】
#   3
#   6
#   5
#   2 2 3 4
# =====================================================================

my $line = <STDIN>;
chomp $line;
my ($n, $m) = split ' ', $line;

# 读取每道题信息：满分 + 正确选项
my @qs;
for my $i (0 .. $m - 1) {
    my @t = split ' ', <STDIN>;
    my $full = $t[0];
    my @ans = sort @t[3 .. $#t];        # 正确选项排序
    $qs[$i] = { full => $full, ans => join('', @ans) };
}

my @wrong = (0) x $m;                   # 每题错误次数
my @scores;
for my $s (0 .. $n - 1) {
    my $sline = <STDIN>;
    chomp $sline;
    my @groups = $sline =~ /\(([^)]*)\)/g;   # 提取每题的 (个数 选项...)
    my $score = 0;
    for my $i (0 .. $m - 1) {
        my @g = split ' ', $groups[$i];
        shift @g;                           # 去掉选中个数
        @g = sort @g;
        my $str = join('', @g);
        if ($str eq $qs[$i]{ans}) {
            $score += $qs[$i]{full};        # 全部正确才得分
        } else {
            $wrong[$i]++;
        }
    }
    push @scores, $score;
}

print "$_\n" for @scores;

my $max = 0;
for my $w (@wrong) {
    $max = $w if $w > $max;
}
if ($max == 0) {
    print "Too simple\n";
} else {
    my @idx;
    for my $i (0 .. $m - 1) {
        push @idx, $i + 1 if $wrong[$i] == $max;
    }
    print join(' ', $max, @idx), "\n";
}
