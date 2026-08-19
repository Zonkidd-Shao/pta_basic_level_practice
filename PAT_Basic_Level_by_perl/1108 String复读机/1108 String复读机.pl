use strict;
use warnings;

# =====================================================================
# 题目：1108 String复读机
# 难度：简单
# 知识点：字符串处理, 统计计数
# =====================================================================
#
# 【题目描述】
#   把给定字符串中的字符按 "String"（注意大小写）的顺序循环输出，
#   每轮依次取 S、t、r、i、n、g 各一个，直到这 6 种字符全部耗尽，
#   其余字符一律忽略。
#
# 【实现原理】
#   1. 统计 S,t,r,i,n,g 六个字符各自的个数。
#   2. 循环：只要还有剩余字符，就按 String 的顺序各输出一个并减计数。
#
# 【输入样例】
#   sTRidlinSayBingStrropriiSHSiRiagIgtSSr
# 【输出样例】
#   StringStringSrigSriSiSii
# =====================================================================

my $line = <STDIN>;
chomp $line;

# 统计六个目标字符的个数
my %cnt;
$cnt{$_}++ for split //, $line;

my @order = split //, 'String';
my @out;

# 只要还有任一目标字符未用完，就按 String 顺序再输出一轮
while (grep { $cnt{$_} > 0 } @order) {
    for my $ch (@order) {
        if ($cnt{$ch} > 0) {
            push @out, $ch;
            $cnt{$ch}--;
        }
    }
}

print join('', @out), "\n";
