use strict;
use warnings;

# =====================================================================
# 题目：1044 火星数字
# 难度：较难
# 知识点：进制转换, 字符串处理, 哈希表
# =====================================================================
#
# 【题目描述】
#   火星人以 13 进制计数。地球数字 0~12 的火星文分别是 tret、jan、
#   feb、mar、apr、may、jun、jly、aug、sep、oct、nov、dec；
#   进位后的 12 个高位词分别是 tam、hel、maa、huh、tou、kes、
#   hei、elo、syy、lok、mer、jou（依次表示 13、26、39、...、156）。
#   实现地球数字与火星数字的相互翻译。
#
# 【实现原理】
#   1. 地球 → 火星：
#      - n==0 输出 tret；
#      - n<13 直接取低位词 low[n]；
#      - n>=13 时，q=n/13（向下取整）、r=n%13：
#        r==0 输出高位词 high[q-1]（例如 13→tam），
#        r>0  输出 high[q-1] 空格 low[r]。
#   2. 火星 → 地球：
#      - 查哈希 %low / %high 得到各位的值并相加。
#   3. 时间复杂度 O(N)，空间复杂度 O(1)。
#
# 【输入样例】
#   4
#   29
#   5
#   elo nov
#   tam
# 【输出样例】
#   hel mar
#   may
#   115
#   13
# =====================================================================

# 低位词数组，下标即数值（0~12）
my @low = qw(tret jan feb mar apr may jun jly aug sep oct nov dec);
# 高位词数组，依次表示 13、26、39、...、156（下标 i 表示 (i+1)*13）
my @high = qw(tam hel maa huh tou kes hei elo syy lok mer jou);

# 火星 → 地球 的数值映射
my %low_val  = map { $low[$_]  => $_        } 0 .. $#low;
my %high_val = map { $high[$_] => ($_+1)*13 } 0 .. $#high;

# 读取查询次数 N
my $n = <STDIN>;
chomp $n;

for my $i (1 .. $n) {
    my $s = <STDIN>;
    chomp $s;

    if ($s =~ /^\d+$/) {
        # 地球数字 → 火星文
        my $num = $s + 0;
        if ($num == 0) {
            print "tret\n";
        } elsif ($num < 13) {
            print "$low[$num]\n";
        } else {
            my $q = int($num / 13);    # 高位值
            my $r = $num % 13;         # 低位值
            if ($r == 0) {
                print "$high[$q-1]\n";
            } else {
                print "$high[$q-1] $low[$r]\n";
            }
        }
    } else {
        # 火星文 → 地球数字
        my @words = split /\s+/, $s;
        my $val = 0;
        # 每个单词查表求和
        for my $w (@words) {
            if (exists $high_val{$w}) {
                $val += $high_val{$w};
            } elsif (exists $low_val{$w}) {
                $val += $low_val{$w};
            }
        }
        print "$val\n";
    }
}
