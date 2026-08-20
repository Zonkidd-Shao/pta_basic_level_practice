use strict;
use warnings;

# =====================================================================
# 题目：1123 舍入
# 难度：较难
# 知识点：字符串处理, 数值舍入
# =====================================================================
#
# 【题目描述】
#   按三种指令处理浮点数的舍入问题：
#   指令 1 为"四舍五入"；指令 2 为"截断"；
#   指令 3 为"四舍六入五成双"。D 为保留的小数位数。
#
# 【实现原理】
#   1. 分离正负号、整数部分 a 和小数部分 b，并把小数部分补齐到 D 位。
#   2. 保留前 D 位为 keep，后面的为 tail，据指令判断是否需要进位。
#   3. 若需进位，把 (a+keep) 整体加一，再按位宽重新切分。
#   4. 组合符号、整数部分和小数部分输出。
#
# 【输入样例】
#   7 3
#   1 3.1415926
#   2 3.1415926
#   3 3.1415926
#   3 3.14150
#   3 3.14250
#   3 3.14251
#   1 3.14
# 【输出样例】
#   3.142
#   3.141
#   3.142
#   3.142
#   3.142
#   3.143
#   3.140
# =====================================================================

my $line = <STDIN>;
chomp $line;
my ($n, $d) = split /\s+/, $line;

sub add_one {
    my ($s) = @_;
    my @digits = split //, $s;
    my $i = $#digits;
    while ($i >= 0 && $digits[$i] eq '9') {
        $digits[$i] = '0';
        $i--;
    }
    if ($i >= 0) {
        $digits[$i]++;
    } else {
        unshift @digits, '1';
    }
    return join('', @digits);
}

for (1 .. $n) {
    my $l = <STDIN>;
    chomp $l;
    my ($mode, $s) = split /\s+/, $l;

    # 分离正负号
    my $sign = '';
    if (substr($s, 0, 1) eq '-') {
        $sign = '-';
        $s = substr($s, 1);
    } elsif (substr($s, 0, 1) eq '+') {
        $s = substr($s, 1);
    }

    # 分离整数部分 a 和小数部分 b
    my ($a, $b);
    if ($s =~ /\./) {
        ($a, $b) = split /\./, $s, 2;
    } else {
        $a = $s;
        $b = '';
    }

    # 小数部分补齐到 D 位，取前 D 位为 keep，其余为 tail
    $b .= '0' x $d;
    my $keep = substr($b, 0, $d);
    my $tail = substr($b, $d);

    my $up = 0;

    if ($mode eq '1') {
        # 四舍五入：tail 首位 >= 5 则进位
        $up = 1 if length($tail) && substr($tail, 0, 1) ge '5';
    } elsif ($mode eq '3' && length($tail)) {
        # 四舍六入五成双
        my $t0 = substr($tail, 0, 1);
        if ($t0 gt '5') {
            $up = 1;                              # 后一位 > 5，进位
        } elsif ($t0 eq '5') {
            my $rest = substr($tail, 1);
            if ($rest =~ /[1-9]/) {
                $up = 1;                          # 5 后面还有非 0 尾数，进位
            } else {
                my $last = length($keep)
                    ? substr($keep, -1, 1)
                    : substr($a, -1, 1);
                $up = 1 if $last % 2;              # 保留末位为单数时进位
            }
        }
    }
    # 指令 2（截断）不处理进位

    if ($up) {
        # 整数部分 + 保留位整体加一，再按位宽重新切分
        my $intpart = $a . $keep;
        $intpart = '0' if $intpart eq '';
        my $t = add_one($intpart);
        $a    = $d ? substr($t, 0, length($t) - $d) : $t;
        $keep = $d ? substr($t, -$d) : '';
    }

    my $out = $sign . $a;
    $out .= '.' . $keep if $d;
    print $out, "\n";
}
