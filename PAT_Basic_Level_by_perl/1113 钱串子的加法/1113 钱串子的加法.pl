use strict;
use warnings;

# =====================================================================
# 题目：1113 钱串子的加法
# 难度：中等
# 知识点：大数加法, 进制转换
# =====================================================================
#
# 【题目描述】
#   实现 30 进制大数加法：数字 0-9 与人类一致，10-29 用字母 a-t
#   表示。两个数都不超过 10^5 位，按位相加，结果不得有前导零。
#
# 【实现原理】
#   1. 从最低位开始逐位相加并处理进位，逢 30 进 1。
#   2. 用 index 将字符转换为数字，用常量串将数字转回字符。
#   3. 结果去除前导零（若全为 0 则输出 "0"）。
#
# 【输入样例】
#   2g50ttaq 0st9hk381
# 【输出样例】
#   11feik2ir
# =====================================================================

# 30 进制数字字符表，下标即对应数值
my $digits = '0123456789abcdefghijklmnopqrst';

my $line = <STDIN>;
chomp $line;
my ($a, $b) = split /\s+/, $line;

my @out;
my $carry = 0;
my $len = length($a) > length($b) ? length($a) : length($b);

# 从最低位开始逐位相加
for (my $i = 1; $i <= $len; $i++) {
    my $x = ($i <= length($a)) ? index($digits, substr($a, length($a) - $i, 1)) : 0;
    my $y = ($i <= length($b)) ? index($digits, substr($b, length($b) - $i, 1)) : 0;
    my $sum = $x + $y + $carry;
    $carry = int($sum / 30);
    my $rem = $sum % 30;
    push @out, substr($digits, $rem, 1);
}
push @out, '1' if $carry;   # 最高位进位

# 逆序还原，去除前导零
my $res = join '', reverse @out;
$res =~ s/^0+//;
$res = '0' if $res eq '';

print "$res\n";
