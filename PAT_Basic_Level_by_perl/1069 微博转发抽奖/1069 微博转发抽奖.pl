use strict;
use warnings;

# =====================================================================
# 题目：1069 微博转发抽奖
# 难度：简单
# 知识点：集合, 模拟
# =====================================================================
#
# 【题目描述】
#   从转发的网友中按顺序每隔 N 个人发一个红包，第一位中奖者序号为 S。
#   已中过奖的人不能再中，若当前位置的人已中奖则顺延一位。
#   按输入顺序输出中奖名单；无人中奖输出 Keep going...。
#
# 【实现原理】
#   1. 记录转发顺序，从第 S 个位置开始，每隔 N 人取一位。
#   2. 用哈希记录已中奖者，遇到已中奖者则顺延一位。
#   3. 收集所有中奖者按顺序输出。
#
# 【输入样例】
#   9 3 2
#   Imgonnawin!
#   PickMe
#   PickMe
#   LookHere
#   Imgonnawin!
#   TryAgainAgain
#   TryAgainAgain
#   Imgonnawin!
#   TryAgainAgain
# 【输出样例】
#   PickMe
#   Imgonnawin!
#   TryAgainAgain
# =====================================================================

my @tok = split /\s+/, join('', <STDIN>);
my $m = shift @tok;   # 转发总量
my $n = shift @tok;   # 中奖间隔
my $s = shift @tok;   # 第一位中奖者序号

my @names = @tok;

my @win;
my %used;
my $i = $s - 1;
while ($i < $m) {
    if (!$used{$names[$i]}) {
        push @win, $names[$i];
        $used{$names[$i]} = 1;
        $i += $n;                    # 跳到下一位中奖者
    } else {
        $i++;                        # 已中奖则顺延一位
    }
}

if (@win) {
    print join("\n", @win), "\n";
} else {
    print "Keep going...\n";
}