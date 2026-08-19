use strict;
use warnings;

# =====================================================================
# 题目：1125 子串与子列
# 难度：中等
# 知识点：双指针, 子序列匹配
# =====================================================================
#
# 【题目描述】
#   子串是字符串中连续的一部分，子列是保持顺序但不一定连续的子集。
#   给定字符串 S 和作为其子列的 P，找出 S 中包含 P 的最短子串；
#   若解不唯一，输出起点最靠左的解。
#
# 【实现原理】
#   1. 从起点 i 向右匹配 P，得到最右匹配位置 j。
#   2. 再从右往左收缩，找到包含 P 的最小结束位置 end。
#   3. 记录该子串长度，更新最短且起点靠左的解，然后从 end+1 继续。
#
# 【输入样例】
#   atpaaabpabttpcat
#   pat
# 【输出样例】
#   pabt
# =====================================================================

my $s = <STDIN>;
chomp $s;
my $p = <STDIN>;
chomp $p;

my $ls = length($s);
my $lp = length($p);

my $bestlen  = $ls + 1;
my $beststart = 0;
my $bestend   = 0;

my $i = 0;
while ($i < $ls) {
    # 从 i 向右找 P 的最右匹配位置 j
    my $j = $i;
    my $k = 0;
    while ($j < $ls && $k < $lp) {
        if (substr($s, $j, 1) eq substr($p, $k, 1)) {
            $k++;
        }
        $j++;
    }
    if ($k < $lp) {
        last;    # 无法再匹配 P，结束
    }

    # 从右向左收缩，找到包含 P 的最小结束位置 end
    my $end = $j - 1;
    $k = $lp - 1;
    while ($end >= $i) {
        if (substr($s, $end, 1) eq substr($p, $k, 1)) {
            $k--;
        }
        last if $k < 0;
        $end--;
    }

    # 记录更短的子串（起点从左向右枚举，自然靠左优先）
    if ($j - $end < $bestlen) {
        $bestlen  = $j - $end;
        $beststart = $end;
        $bestend   = $j;
    }

    $i = $end + 1;
}

print substr($s, $beststart, $bestend - $beststart), "\n";
