use strict;
use warnings;

# =====================================================================
# 题目：1078 字符串压缩与解压
# 难度：简单
# 知识点：字符串处理, 模拟
# =====================================================================
#
# 【题目描述】
#   将连续重复的字符用"个数+字符"表示即压缩；反过来把"个数+字符"
#   还原为重复的字符即解压。若字符无重复则原样输出。
#
# 【实现原理】
#   1. 压缩：统计每个连续字符片段的长度，长度大于 1 时输出"长度+字符"。
#   2. 解压：遇到数字时先收集完整的数字（可能多位），再将其后紧跟的
#      单个字符重复该次数。
#   3. 按模式（C 压缩 / D 解压）分别处理。
#
# 【输入样例】
#   C
#   TTTTThhiiiis isssss a   tesssst CAaaa as
# 【输出样例】
#   5T2h4is i5s a3 te4st CA3a as
# =====================================================================

# 读取模式字符（C 压缩 / D 解压）
my $mode = <STDIN>; chomp $mode;
# 读取待处理的字符串
my $s = <STDIN>; chomp $s;

my $out = '';

if ($mode eq 'C') {
    # 压缩：统计连续相同字符的个数
    my $i = 0;
    while ($i < length $s) {
        my $c = substr($s, $i, 1);
        my $j = $i;
        while ($j < length $s && substr($s, $j, 1) eq $c) { $j++; }
        my $cnt = $j - $i;
        $out .= $cnt . $c if $cnt > 1;   # 有重复时输出个数+字符
        $out .= $c if $cnt == 1;         # 无重复则原样输出
        $i = $j;
    }
} else {
    # 解压：把"个数+字符"还原
    my $i = 0;
    while ($i < length $s) {
        my $c = substr($s, $i, 1);
        if ($c =~ /\d/) {
            # 收集完整数字
            my $j = $i;
            while ($j < length $s && substr($s, $j, 1) =~ /\d/) { $j++; }
            my $num = substr($s, $i, $j - $i);
            my $ch = substr($s, $j, 1);
            $out .= $ch x $num;
            $i = $j + 1;
        } else {
            # 非数字字符原样输出
            $out .= $c;
            $i++;
        }
    }
}

print "$out\n";
