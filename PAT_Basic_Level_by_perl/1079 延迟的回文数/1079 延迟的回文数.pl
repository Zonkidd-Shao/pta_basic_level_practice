use strict;
use warnings;

# =====================================================================
# 题目：1079 延迟的回文数
# 难度：较难
# 知识点：大数加法, 回文判断, 模拟
# =====================================================================
#
# 【题目描述】
#   给定一个不超过 1000 位的正整数，反复执行"该数 + 其逆序数"的操作，
#   直到结果成为回文数（最多 10 步）。逐步输出 A + B = C，
#   若 10 步内得到回文数则输出 "C is a palindromic number."，
#   否则输出 "Not found in 10 iterations."。
#
# 【实现原理】
#   1. 判断当前数是否为回文数（与其逆序串相等）。
#   2. 否则计算其与逆序数之和，由于位数可达 1000 位，须用逐位加法实现。
#   3. 每步把当前数更新为和，循环最多 10 次。
#
# 【输入样例】
#   97152
# 【输出样例】
#   97152 + 25179 = 122331
#   122331 + 133221 = 255552
#   255552 is a palindromic number.
# =====================================================================

# 读取正整数（可能非常长，作为字符串处理）
my $n = <STDIN>; chomp $n;
$n =~ s/\s+//g;

my $found = 0;

for my $iter (1..10) {
    my $r = reverse $n;

    # 若为回文数，输出并结束
    if ($n eq $r) {
        print "$n is a palindromic number.\n";
        $found = 1;
        last;
    }

    # 大数加法：逐位相加（两个数等长，n 与 reverse n）
    # 每个字符如 "9" 在数值上下文中即等于 9
    my @na = split //, $n;
    my @ra = split //, $r;
    my @c;
    my $carry = 0;
    for (my $i = $#na; $i >= 0; $i--) {
        my $z = $na[$i] + $ra[$i] + $carry;
        unshift @c, $z % 10;
        $carry = int($z / 10);
    }
    unshift @c, $carry if $carry;
    my $c = join('', @c);

    print "$n + $r = $c\n";
    $n = $c;
}

print "Not found in 10 iterations.\n" unless $found;
