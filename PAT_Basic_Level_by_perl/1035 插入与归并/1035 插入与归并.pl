use strict;
use warnings;

# =====================================================================
# 题目：1035 插入与归并
# 难度：中等
# 知识点：排序算法, 模拟, 数组操作
# =====================================================================
#
# 【题目描述】
#   给定原始序列和由某排序算法（插入排序或归并排序）产生的中间序列，
#   判断是哪种排序，并输出该算法再迭代一轮后的结果序列。
#
# 【实现原理】
#   1. 插入排序检测：从原始序列逐轮模拟插入排序，每轮使前 k 个元素有序；
#      若某轮结果等于目标序列，则判为插入排序，再对前 k+1 个元素排序作为下一轮。
#   2. 归并排序：若插入不匹配，则从原始序列以块长 1,2,4,... 逐轮归并，
#      找到与目标序列相等的最小块长，再以该块长的两倍归并一次作为下一轮。
#   3. 时间复杂度：O(N^2 log N)（N<=100，可接受）。
#
# 【输入样例】
#   10
#   3 1 2 8 7 5 9 4 6 0
#   1 2 3 7 8 5 9 4 6 0
# 【输出样例】
#   Insertion Sort
#   1 2 3 5 7 8 9 4 6 0
# =====================================================================

# 读取 N、原始序列、目标序列
my $n = <STDIN>;
chomp $n;
my @orig   = split /\s+/, <STDIN>;
my @target = split /\s+/, <STDIN>;

my $insert = 0;   # 是否为插入排序

# ---- 插入排序检测：从原始序列模拟 ----
for (my $i = 1; $i < $n; $i++) {
    my @a = @orig;
    # 对前 i+1 个元素排序（模拟第 i 轮插入）
    my @pre = sort { $a <=> $b } @a[0 .. $i];
    @a[0 .. $i] = @pre;

    if (join(' ', @a) eq join(' ', @target)) {
        # 命中：下一轮对前 i+2 个元素排序
        my $end = $i + 1 < $n - 1 ? $i + 1 : $n - 1;
        my @pre2 = sort { $a <=> $b } @a[0 .. $end];
        @a[0 .. $end] = @pre2;
        print "Insertion Sort\n";
        print join(' ', @a), "\n";
        $insert = 1;
        last;
    }
}

# ---- 归并排序：从原始序列逐轮归并 ----
if (!$insert) {
    # 按块长 size 对原始序列每个相邻块排序，返回归并一轮的结果
    sub blocksort {
        my ($arr, $size) = @_;
        my @res;
        for (my $i = 0; $i < @$arr; $i += $size) {
            my $hi = $i + $size - 1;
            $hi = @$arr - 1 if $hi >= @$arr;
            push @res, sort { $a <=> $b } @$arr[$i .. $hi];
        }
        return @res;
    }

    my $size = 2;   # 当前归并后的有序块大小（第 k 轮后块大小为 2^k）
    while (1) {
        # 块大小为 size 时的状态
        my @m = blocksort(\@orig, $size);
        last if join(' ', @m) eq join(' ', @target);
        $size *= 2;
    }

    # 下一轮以块大小 size*2 归并
    my @res = blocksort(\@orig, $size * 2);
    print "Merge Sort\n";
    print join(' ', @res), "\n";
}