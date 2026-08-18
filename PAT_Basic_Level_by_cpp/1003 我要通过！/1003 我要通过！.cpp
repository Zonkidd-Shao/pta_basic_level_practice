// 1003 我要通过！
// 判定字符串是否满足 PAT 判定条件：
//   1. 仅含 P、A、T 三种字符；
//   2. 形如 xPATx 正确（x 为空或仅由 A 组成）；
//   3. 若 aPbTc 正确，则 aPbATca 也正确。
// 等价判定：恰好一个 P、一个 T，P 在 T 之前，
//   记 a = P 前 A 的个数，b = P、T 之间 A 的个数，c = T 后 A 的个数，
//   则要求 b >= 1 且 a * b == c。
//
// 【实现原理】
// 算法思路：
//   本题本质上是找规律题。通过条件 2 和条件 3 的递推，可以推导出数学关系：
//   - 基础形式 "xPATx" 中，P 前的 A 数 = T 后的 A 数，且中间有一个 A，即 a = c, b = 1。
//   - 递推规则：若 aPbTc 正确，则 aPbATca 也正确，即 b 增加 1 时，c 增加 a。
//   - 因此最终形式为：a * b = c，其中 b >= 1。
// 关键步骤：
//   1. 遍历字符串，检查是否只有 P、A、T 三种字符，且 P 和 T 各出现一次。
//   2. 确保 P 在 T 之前。
//   3. 计算三段 A 的个数 a、b、c，验证 b >= 1 且 a * b == c。
// 时间复杂度：O(len(s))，单次遍历即可完成所有检查。
// 空间复杂度：O(1)。
#include <iostream>
#include <string>

using namespace std;

bool isValid(const string& s) {
    int pPos = -1, tPos = -1;
    for (size_t i = 0; i < s.size(); ++i) {
        char c = s[i];
        if (c != 'P' && c != 'A' && c != 'T') return false; // 出现非法字符
        if (c == 'P') {
            if (pPos != -1) return false; // P 多于一个
            pPos = (int)i;
        } else if (c == 'T') {
            if (tPos != -1) return false; // T 多于一个
            tPos = (int)i;
        }
    }
    if (pPos == -1 || tPos == -1 || pPos >= tPos) return false; // 缺少 P/T 或顺序错误

    int a = pPos;                  // P 之前 A 的个数
    int b = tPos - pPos - 1;       // P 与 T 之间 A 的个数
    int c = (int)s.size() - tPos - 1; // T 之后 A 的个数

    if (b < 1) return false;       // 中间至少要有 1 个 A
    return a * b == c;             // 核心递推关系
}

int main() {
    int n;
    if (!(cin >> n)) return 0;

    string s;
    for (int i = 0; i < n; ++i) {
        cin >> s;
        cout << (isValid(s) ? "YES" : "NO") << endl;
    }
    return 0;
}