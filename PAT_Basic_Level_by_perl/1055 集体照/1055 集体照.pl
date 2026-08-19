use strict;
use warnings;

# =====================================================================
# 题目：1055 集体照
# 难度：中等
# 知识点：排序, 模拟
# =====================================================================
#
# 【题目描述】
#   将 N 个人排成 K 排：每排人数为 N/K（向下取整），多余的人全站最后一排。
#   每排最高者站中间，其他人按身高非增序、以中间人为轴先右后左交替入队；
#   身高相同按名字字典序升序。输出各排人名（后排在上方）。
#
# 【实现原理】
#   1. 按（身高降序，名字升序）排序所有人。
#   2. 计算第一排（后排）人数，其余排人数均为 N/K。
#   3. 对每排：最高者放中间，然后交替向两侧（摄影师视角：先左后右）放置。
#   4. 逐排输出。
#
# 【输入样例】
#   10 3
#   Tom 188
#   Mike 170
#   Eva 168
#   Tim 160
#   Joe 190
#   Ann 168
#   Bob 175
#   Nick 186
#   Amy 160
#   John 159
# 【输出样例】
#   Bob Tom Joe Nick
#   Ann Mike Eva
#   Tim Amy John
# =====================================================================

my @lines = <STDIN>;
my ($n, $k) = split /\s+/, $lines[0];

my @people;
for my $i (1 .. $#lines) {
    my ($name, $h) = split /\s+/, $lines[$i];
    push @people, [$h, $name];          # 便于排序
}
@people = sort { $b->[0] <=> $a->[0] || $a->[1] cmp $b->[1] } @people;  # 身高降序，名字升序

my $per = int($n / $k);                 # 普通排人数
my $first = $n - $per * ($k - 1);       # 最后一排（后排）人数

my $idx = 0;
for my $r (0 .. $k - 1) {
    my $m = ($r == 0) ? $first : $per;  # 第一排为后排，人数较多
    my @row = (0) x $m;
    my $mid = int($m / 2);
    $row[$mid] = $people[$idx][1];      # 最高者站中间
    $idx++;
    my $l = $mid - 1;                   # 中间偏左
    my $rr = $mid + 1;                  # 中间偏右
    my $filled = 1;                     # 已放入的人数
    while ($filled < $m) {
        if ($l >= 0) { $row[$l] = $people[$idx][1]; $l--; $idx++; $filled++; }
        if ($filled < $m && $rr < $m) { $row[$rr] = $people[$idx][1]; $rr++; $idx++; $filled++; }
    }
    print join(' ', @row), "\n";
}