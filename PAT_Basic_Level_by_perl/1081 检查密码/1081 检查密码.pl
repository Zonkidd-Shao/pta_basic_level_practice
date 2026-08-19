use strict;
use warnings;

# =====================================================================
# 题目：1081 检查密码
# 难度：简单
# 知识点：字符串处理, 条件判断
# =====================================================================
#
# 【题目描述】
#   检查用户密码是否合法。合法密码须不少于 6 个字符，只能由英文字母、
#   数字和小数点 '.' 组成，且必须既有字母也有数字。
#   按不同情况输出对应的提示信息。
#
# 【实现原理】
#   1. 长度不足 6 输出"太短"。
#   2. 存在非法字符（非字母、非数字、非'.'）输出"太乱"。
#   3. 无字母输出"needs zi mu"；无数字输出"needs shu zi"；否则合法。
#
# 【输入样例】
#   5
#   123s
#   ...
# 【输出样例】
#   Your password is tai duan le.
#   ...
# =====================================================================

# 读取密码数量 N
my $n = <STDIN>; chomp $n;

for (1..$n) {
    my $s = <STDIN>;
    chomp $s;

    if (length($s) < 6) {
        # 密码太短
        print "Your password is tai duan le.\n";
    } elsif ($s =~ /[^A-Za-z0-9.]/) {
        # 存在非法字符（只允许字母、数字、小数点）
        print "Your password is tai luan le.\n";
    } elsif ($s !~ /[A-Za-z]/) {
        # 只有数字，缺少字母
        print "Your password needs zi mu.\n";
    } elsif ($s !~ /[0-9]/) {
        # 只有字母，缺少数字
        print "Your password needs shu zi.\n";
    } else {
        # 合法密码
        print "Your password is wan mei.\n";
    }
}
