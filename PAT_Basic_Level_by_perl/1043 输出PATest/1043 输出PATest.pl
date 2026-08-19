use strict;
use warnings;

# =====================================================================
# 题目：1043 输出PATest
# 难度：简单
# 知识点：字符计数, 循环输出
# =====================================================================
#
# 【题目描述】
#   给定一个仅由英文字母构成的字符串，忽略其它字符，将其中的
#   P、A、T、e、s、t 六种字符按 "PATestPATest..." 顺序循环输出，
#   直到所有字符输出完毕。
#
# 【实现原理】
#   1. 统计字符串中 P、A、T、e、s、t 各自的出现次数。
#   2. 只要还有字符未输出，就按 P A T e s t 的顺序循环输出，
#      每输出一个对应计数减一。
#   3. 时间复杂度 O(L)，空间复杂度 O(1)。
#
# 【输入样例】
#   redlesPayBestPATTopTeePHPereatitAPPT
# 【输出样例】
#   PATestPATestPTetPTePePee
# =====================================================================

# 读取整行字符串
my $line = <STDIN>;
chomp $line;

# 统计 P A T e s t 六种字符的出现次数
my %cnt = ('P'=>0, 'A'=>0, 'T'=>0, 'e'=>0, 's'=>0, 't'=>0);
for my $ch (split //, $line) {
    # 只统计需要的六种字符，其余忽略
    $cnt{$ch}++ if exists $cnt{$ch};
}

# 按 PATest 顺序循环输出，直到全部输出完毕
my @order = qw(P A T e s t);
my $out = '';
while (1) {
    my $any = 0;
    for my $ch (@order) {
        if ($cnt{$ch} > 0) {
            # 输出一个字符并减一
            $out .= $ch;
            $cnt{$ch}--;
            $any = 1;
        }
    }
    # 一轮中没有任何输出，说明全部输出完毕
    last unless $any;
}

print "$out\n";
