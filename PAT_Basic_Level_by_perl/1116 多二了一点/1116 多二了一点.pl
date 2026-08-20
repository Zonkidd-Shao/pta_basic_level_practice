use strict;
use warnings;

# =====================================================================
# 题目：1116 多二了一点
# 难度：简单
# 知识点：字符串, 大数比较
# =====================================================================
#
# 【题目描述】
#   若正整数有偶数个数位，后一半数位组成的数恰好比前一半数位
#   组成的数多 2，则称"多二了一点"。判断输入整数的情况并输出。
#
# 【实现原理】
#   1. 若位数为奇数，输出 Error: X digit(s)。
#   2. 否则取前后两半数字，判断后一半减前一半是否等于 2。
#   3. 按 Yes/No 对应格式输出。
#
# 【输入样例】
#   233235
# 【输出样例】
#   Yes: 235 - 233 = 2
# =====================================================================

# 读取输入字符串（可能很长，不能转成数值）
my $s = <STDIN>;
chomp $s;

sub normalize {
    my ($v) = @_;
    $v =~ s/^0+//;
    return $v eq '' ? '0' : $v;
}

sub cmp_abs {
    my ($a, $b) = @_;
    return length($a) <=> length($b) || $a cmp $b;
}

sub subtract_abs {
    my ($a, $b) = @_;       # 要求 a >= b
    my @a = split //, $a;
    my @b = split //, $b;
    my @out;
    my ($i, $j, $borrow) = ($#a, $#b, 0);
    while ($i >= 0) {
        my $x = $a[$i] - $borrow;
        my $y = $j >= 0 ? $b[$j] : 0;
        if ($x < $y) {
            $x += 10;
            $borrow = 1;
        } else {
            $borrow = 0;
        }
        unshift @out, $x - $y;
        $i--;
        $j--;
    }
    return normalize(join('', @out));
}

if (length($s) % 2) {
    # 奇数个数位
    print "Error: ", length($s), " digit(s)\n";
}
else {
    my $h = int(length($s) / 2);
    my $a = normalize(substr($s, 0, $h));  # 前一半
    my $b = normalize(substr($s, $h));     # 后一半

    my $cmp = cmp_abs($b, $a);
    my ($diff_sign, $diff_abs);
    if ($cmp >= 0) {
        $diff_sign = '';
        $diff_abs = subtract_abs($b, $a);
    } else {
        $diff_sign = '-';
        $diff_abs = subtract_abs($a, $b);
    }
    my $diff = $diff_sign . $diff_abs;

    if ($diff eq '2') {
        print "Yes: $b - $a = 2\n";
    }
    else {
        print "No: $b - $a != 2\n";
    }
}
