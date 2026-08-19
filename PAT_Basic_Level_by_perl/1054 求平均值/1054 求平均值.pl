use strict;
use warnings;

# =====================================================================
# 题目：1054 求平均值
# 难度：中等
# 知识点：字符串处理, 数值校验, 浮点精度
# =====================================================================
#
# 【题目描述】
#   给定 N 个实数，计算平均值。合法输入为 [-1000, 1000] 内的实数且最多精确到
#   小数点后 2 位。非法输入要逐行报错，最后输出合法数的平均值（保留 2 位）。
#
# 【实现原理】
#   1. 用正则校验每个字符串是否为合法的十进制数（至多 2 位小数）。
#   2. 再检查数值是否落在 [-1000, 1000] 区间内。
#   3. 合法数求和计数，非法数输出 ERROR；最后按 K 的值分情况输出平均值。
#
# 【输入样例】
#   7
#   5 -3.2 aaa 9999 2.3.4 7.123 2.35
# 【输出样例】
#   ERROR: aaa is not a legal number
#   ERROR: 9999 is not a legal number
#   ERROR: 2.3.4 is not a legal number
#   ERROR: 7.123 is not a legal number
#   The average of 3 numbers is 1.38
# =====================================================================

my @lines = <STDIN>;
my $n = $lines[0];
my @tok = split /\s+/, $lines[1];

my ($sum, $cnt) = (0, 0);
for my $x (@tok) {
    # 校验：可选正负号 + 整数位 + 可选最多两位小数
    if ($x =~ /^-?\d+(\.\d{1,2})?$/ && $x >= -1000 && $x <= 1000) {
        $sum += $x;
        $cnt++;
    } else {
        print "ERROR: $x is not a legal number\n";
    }
}

if ($cnt == 0) {
    print "The average of 0 numbers is Undefined\n";
} elsif ($cnt == 1) {
    printf "The average of 1 number is %.2f\n", $sum;
} else {
    printf "The average of %d numbers is %.2f\n", $cnt, $sum / $cnt;
}