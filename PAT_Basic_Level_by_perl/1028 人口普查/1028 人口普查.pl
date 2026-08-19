use strict;
use warnings;

# =====================================================================
# 题目：1028 人口普查
# 难度：简单
# 知识点：字符串比较, 模拟
# =====================================================================
#
# 【题目描述】
#   给定若干居民的姓名和生日，过滤出在 [1814/09/06, 2014/09/06]
#   范围内的合理生日，统计有效人数并输出最年长和最年轻者姓名。
#
# 【实现原理】
#   1. 日期按 yyyy/mm/dd 字符串比较即等价于日期大小比较。
#   2. 统计有效生日个数，记录最小日期（最年长）和最大日期（最年轻）。
#
# 【输入样例】
#   5
#   John 2001/05/12
#   Tom 1814/09/06
#   Ann 2121/01/30
#   James 1814/09/05
#   Steve 1967/11/20
# 【输出样例】
#   3 Tom John
# =====================================================================

my $line = <STDIN>;
chomp $line;
my $n = $line;

my ($lo, $hi) = ('1814/09/06', '2014/09/06');
my ($cnt, $oldest_date, $youngest_date) = (0, '', '');
my ($oldest_name, $youngest_name) = ('', '');

for (1 .. $n) {
    my $l = <STDIN>;
    chomp $l;
    my ($name, $d) = split / +/, $l;
    next if $d lt $lo || $d gt $hi;   # 超出合理范围则过滤
    $cnt++;
    if ($cnt == 1 || $d lt $oldest_date) {
        $oldest_date = $d; $oldest_name = $name;   # 最早即最年长
    }
    if ($cnt == 1 || $d gt $youngest_date) {
        $youngest_date = $d; $youngest_name = $name;  # 最晚即最年轻
    }
}

if ($cnt == 0) {
    print "0\n";
} else {
    print "$cnt $oldest_name $youngest_name\n";
}