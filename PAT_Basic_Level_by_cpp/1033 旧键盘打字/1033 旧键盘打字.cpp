/*
 * 1033 旧键盘打字
 *
 * 【实现原理】
 * 题目给出坏掉的键和欲打出的文本，输出实际能打出的文本。
 * 规则与 1029 旧键盘相反：这里是已知坏键，求实际输出。
 * - 字母键坏了，其大小写都不能打出
 * - 上档键 '+' 坏了，所有大写英文字母都不能打出
 * - 其他字符（数字、符号等）坏了则对应的字符不能打出
 *
 * 【算法思路】
 * 1. 读取坏键字符串（可能为空，需用 getline）
 * 2. 用布尔数组标记坏掉的字符
 * 3. 特殊标记 '+' 键的状态
 * 4. 遍历欲打出的文本，判断每个字符是否能打出：
 *    - 大写字母：若 '+' 坏了则不能打出；若对应大写字母（作为键）坏了也不能打出
 *    - 小写字母/其他字符：对应大写形式（作为键）或原字符是否在坏键中
 * 5. 输出所有能打出的字符
 *
 * 【关键点】
 * - 坏键字符串可能为空（第一行为空行），需使用 getline 而非 cin
 * - 字母键统一转大写判断：因为描述中坏键是大写字母
 * - 数组下标使用 unsigned char 防止负数 char 越界
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + M)，N 为坏键长度，M 为文本长度
 * - 空间复杂度：O(1)，使用固定 256 大小的布尔数组
 */

#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main() {
    string broken, text;
    // 使用 getline 读取整行（坏键可能为空行）
    if (!getline(cin, broken)) return 0;
    getline(cin, text);

    bool brokenChar[256] = {false};  // 标记坏掉的字符
    bool hasPlus = false;             // 是否坏掉上档键 '+'

    for (char c : broken) {
        brokenChar[(unsigned char)c] = true;
        if (c == '+') hasPlus = true;  // 上档键坏，影响所有大写字母
    }

    for (char c : text) {
        // 若为大写字母且 '+' 键坏了，则不能打出
        if (isupper((unsigned char)c) && hasPlus) continue;
        // 若该字符（统一转为大写判断对应的键）在坏键中，则不能打出
        if (brokenChar[(unsigned char)toupper((unsigned char)c)]) continue;
        cout << c;  // 能打出，输出
    }
    cout << endl;
    return 0;
}