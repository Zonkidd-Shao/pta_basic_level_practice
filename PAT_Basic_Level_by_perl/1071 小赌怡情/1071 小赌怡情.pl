use strict;
use warnings;

# =====================================================================
# 题目：1071 小赌怡情
# 难度：简单
# 知识点：模拟
# =====================================================================
#
# 【题目描述】
#   模拟下注游戏：每轮给出 n1 b t n2，玩家赌第二个数比第一个大还是小。
#   猜对赢得 t 筹码，猜错扣除 t 筹码；下注不能超过持有筹码；
#   筹码输光输出 Game Over 并结束。
#
# 【实现原理】
#   1. 若下注 t 大于持有筹码，输出 Not enough tokens 并跳过本轮。
#   2. 根据 b 与 n1、n2 的大小关系判断输赢并更新筹码。
#   3. 筹码归零时输出 Game Over 并结束。
#
# 【输入样例】
#   100 4
#   8 0 100 2
#   3 1 50 1
#   5 1 200 6
#   7 0 200 8
# 【输出样例】
#   Win 100!  Total = 200.
#   Lose 50.  Total = 150.
#   Not enough tokens.  Total = 150.
#   Not enough tokens.  Total = 150.
# =====================================================================

my $line = <STDIN>;
chomp $line;
my ($money, $k) = split /\s+/, $line;

for (1 .. $k) {
    my $l = <STDIN>;
    chomp $l;
    my ($n1, $b, $t, $n2) = split /\s+/, $l;

    if ($t > $money) {                       # 下注超过持有筹码
        print "Not enough tokens.  Total = $money.\n";
        next;
    }

    my $win = ($b == 1) ? ($n2 > $n1) : ($n2 < $n1);
    if ($win) {
        $money += $t;
        print "Win $t!  Total = $money.\n";
    } else {
        $money -= $t;
        print "Lose $t.  Total = $money.\n";
        if ($money == 0) {                   # 输光则游戏结束
            print "Game Over.\n";
            last;
        }
    }
}