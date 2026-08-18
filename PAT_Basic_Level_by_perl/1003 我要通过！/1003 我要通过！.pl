use strict;
use warnings;

# =====================================================================
# 题目：1003 我要通过！
# 难度：简单
# 知识点：正则表达式、字符串匹配、数学规律推导
# =====================================================================
#
# 【题目描述】
#   判定字符串是否满足 PAT "答案正确" 的条件：
#   1. 字符串中必须仅有 P、A、T 三种字符
#   2. 形如 xPATx 的字符串正确（x 为空或仅由 A 组成）
#   3. 如果 aPbTc 正确，那么 aPbATca 也正确
#
# 【实现原理】
#   核心思路：通过数学归纳法推导正确字符串的结构规律。
#
#   规律推导：
#   - 基础形式：xPATx  →  P 前有 len(a) 个 A，P 和 T 之间有 1 个 A，
#                         T 后有 len(a) 个 A
#                         满足：len(a) * 1 = len(c)
#   - 归纳扩展：每次在 P 和 T 之间增加一个 A，T 后就增加 len(a) 个 A
#     即：若 aPbTc 正确（b 个 A 在中间，c 个 A 在末尾），
#         则 aP(b+1)T(c+len(a)) 也正确
#     仍满足：len(a) * (len(b)+1) = len(c) + len(a)
#                          = len(c) + len(a)
#     数学归纳可证：始终有 len(a) * len(b) == len(c)
#
#   判定步骤：
#   1. 检查字符合法性：只能包含 P、A、T
#   2. 检查 P 和 T 的个数：都必须恰好为 1 个
#   3. 用正则匹配结构：(A*)P(A+)T(A*)，即 P 前、中间、T 后都只能是 A
#      且中间部分不能为空（否则没有 A，无法构成 AT 结构）
#   4. 验证数学规律：len(a) * len(b) == len(c)
#
#   时间复杂度：O(L)，L 为字符串长度
#   空间复杂度：O(1)
#
# 【输入样例】
#   10
#   PAT PAAT AAPATAA AAPAATAAAA xPATx PT Whatever APAAATAA APT APATTAA
# 【输出样例】
#   YES YES YES YES NO NO NO NO NO NO
# =====================================================================

# 判定单个字符串是否满足 PAT 正确条件的子例程
sub is_valid {
    my ($s) = @_;

    # 条件 1：只能包含 P、A、T 三种字符
    return 0 if $s =~ /[^PAT]/;

    # 统计 P 和 T 的出现次数
    # () =  在列表上下文中使用正则匹配，返回所有匹配结果
    # scalar 上下文赋值给变量时，通过 ()= 运算符将结果转为计数
    my $p = () = $s =~ /P/g;
    my $t = () = $s =~ /T/g;

    # 条件 2：P 和 T 都必须恰好出现 1 次
    return 0 if $p != 1 || $t != 1;

    # 条件 3：匹配结构 aPbTc，其中 a、b、c 均为 A 组成的串（可为空）
    #   (A*)  — P 之前的 a 部分（0 个或多个 A）
    #   P     — 恰好一个 P
    #   (A+)  — P 和 T 之间的 b 部分（至少 1 个 A）
    #   T     — 恰好一个 T
    #   (A*)  — T 之后的 c 部分（0 个或多个 A）
    return 0 unless $s =~ /^(A*)P(A+)T(A*)$/;

    # 提取三部分的 A 串
    my ($a, $b, $c) = ($1, $2, $3);

    # 条件 4：核心数学规律 — len(a) * len(b) == len(c)
    # 这是从递归规则中归纳出的充要条件
    return (length($a) * length($b) == length($c)) ? 1 : 0;
}

# 读取测试用例数 n
my $n = <STDIN>;
chomp $n;

# 读取第二行所有字符串
my $rest = <STDIN>;
chomp $rest;
# 按空白分割，得到字符串数组
my @strs = split /\s+/, $rest;

# 逐个判定并输出结果
for my $s (@strs) {
    print is_valid($s) ? "YES\n" : "NO\n";
}
