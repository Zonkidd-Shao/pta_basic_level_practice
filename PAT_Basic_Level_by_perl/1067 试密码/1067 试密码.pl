use strict;
use warnings;

# =====================================================================
# 题目：1067 试密码
# 难度：简单
# 知识点：字符串处理, 循环
# =====================================================================
#
# 【题目描述】
#   模拟登录：给定正确密码和允许尝试次数 N。
#   输入错误密码输出"Wrong password: 密码"；
#   正确则输出"Welcome in"并结束；错误达 N 次输出"Account locked"并结束；
#   读到单个 # 时结束输入。
#
# 【实现原理】
#   1. 读取正确密码与尝试次数 N。
#   2. 逐行读取尝试，遇到 # 结束。
#   3. 密码正确输出 Welcome in 并退出；错误计数达到 N 则锁定。
#
# 【输入样例】
#   Correct%pw 3
#   correct%pw
#   Correct@PW
#   whatisthepassword!
#   Correct%pw
#   #
# 【输出样例】
#   Wrong password: correct%pw
#   Wrong password: Correct@PW
#   Wrong password: whatisthepassword!
#   Account locked
# =====================================================================

my $line = <STDIN>;
chomp $line;
my ($pw, $n) = split /\s+/, $line;
$n = $n + 0;

my $wrong = 0;
while (my $l = <STDIN>) {
    chomp $l;
    last if $l eq '#';                 # 结束标记
    if ($l eq $pw) {
        print "Welcome in\n";
        last;
    }
    print "Wrong password: $l\n";
    $wrong++;
    if ($wrong >= $n) {                # 错误次数达上限则锁定
        print "Account locked\n";
        last;
    }
}