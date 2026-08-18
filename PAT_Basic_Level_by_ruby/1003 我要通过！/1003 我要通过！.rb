# 1003 我要通过！
#
# 题目描述：
#   “**答案正确**”是自动判题系统给出的最令人欢喜的回复。本题属于 PAT 的“**答案正确**”大派送 —— 只要读入的字符串满足下列条件，系统就输出“**答案正确**”，否则输出“**答案错误**”。
#   得到“**答案正确**”的条件是：
#   1. 字符串中必须仅有 `P`、 `A`、 `T`这三种字符，不可以包含其它字符；
#   2. 任意形如 `xPATx` 的字符串都可以获得“**答案正确**”，其中 `x` 或者是空字符串，或者是仅由字母 `A` 组成的字符串；
#   3. 如果 `aPbTc` 是正确的，那么 `aPbATca` 也是正确的，其中 `a`、 `b`、 `c` 均或者是空字符串，或者是仅由字母 `A` 组成的字符串。
#   现在就请你为 PAT 写一个自动裁判程序，判定哪些字符串是可以获得“**答案正确**”的。
#
# 实现原理：
#   使用正则表达式验证字符串格式；根据题目条件逐步判断字符串是否符合要求；检查PAT的出现形式和数量关系
#

# 判断字符串是否“答案正确”
# @param s [String] 待判定字符串
# @return [Boolean]
def pat_correct?(s)
  return false unless s.match?(/\A[APT]+\z/)

  p_idx = s.index('P')
  t_idx = s.index('T')
  # 必须恰好一个 P、一个 T，且 P 在 T 之前，中间至少有一个 A
  return false if p_idx.nil? || t_idx.nil?
  return false if s.count('P') != 1 || s.count('T') != 1
  return false if t_idx - p_idx < 2

  a = s[0...p_idx]
  b = s[p_idx + 1...t_idx]
  c = s[t_idx + 1..]

  return false unless a.each_char.all? { |ch| ch == 'A' }
  return false unless b.each_char.all? { |ch| ch == 'A' }
  return false unless c.each_char.all? { |ch| ch == 'A' }

  a.length * b.length == c.length
end

if __FILE__ == $PROGRAM_NAME
  n = gets.to_i
  n.times do
    s = gets(chomp: true)
    puts pat_correct?(s) ? 'YES' : 'NO'
  end
end
