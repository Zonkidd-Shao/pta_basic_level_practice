/*
 * 1029 旧键盘
 *
 * 【实现原理】
 * 题目给出实际打出的文字（typed）和期望打出的文字（expected），
 * 找出键盘上坏掉的键。坏掉的键会导致该字符无法打出，因此实际输出中会缺失该字符。
 * 通过逐字符比较两行文字，找出 expected 中有而 typed 中没有（或位置错位）的字符。
 * 
 * 注意：题目保证至少有一处不同，且坏键以大写字母形式输出，按发现的先后顺序。
 *
 * 【算法思路】
 * 1. 同时遍历 expected 和 typed 字符串
 * 2. 如果 expected[i] != typed[i]，说明 expected[i] 对应的键是坏掉的
 * 3. 将坏键转为大写后输出，并用布尔数组标记已输出，避免重复
 * 4. 注意当 typed 比 expected 短时，typed[i] 可能不存在，视为不相等
 *
 * 【关键点】
 * - 大小写转换：所有坏键统一以大写形式输出，使用 toupper() 函数
 * - 去重：使用 bool printed[256] 数组记录已输出的字符，防止重复打印
 * - 当 typed 比 expected 短时，超出 typed 长度的 expected 字符也视为坏键
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N)，其中 N 为 expected 字符串长度
 * - 空间复杂度：O(1)，使用固定大小的布尔数组（256 个 ASCII 字符）
 */

#include <iostream>
#include <string>
#include <cctype>

using namespace std;

int main() {
    string typed, expected;
    if (!(cin >> typed >> expected)) return 0;

    bool printed[256] = {false};  // 标记已输出的字符，避免重复打印
    for (size_t i = 0; i < expected.size(); ++i) {
        char e = expected[i];                 // 期望字符
        char t = (i < typed.size()) ? typed[i] : 0;  // 实际字符，若 typed 较短则视为空
        if (e != t) {                         // 字符不同，说明该键坏掉
            char up = (char)toupper((unsigned char)e);  // 统一转为大写
            if (!printed[(unsigned char)up]) {          // 未输出过则输出
                cout << up;
                printed[(unsigned char)up] = true;
            }
        }
    }
    cout << endl;
    return 0;
}