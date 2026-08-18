// 1006 换个格式输出整数
// 用 B 表示"百"、S 表示"十"，用 123...n 表示个位数字 n（n < 10）。
// 输入为不超过 3 位的正整数。
//
// 【实现原理】
// 算法思路：
//   将三位数的百位、十位、个位分别提取出来，按题目要求格式化输出：
//   - 百位数字决定了输出多少个 'B'
//   - 十位数字决定了输出多少个 'S'
//   - 个位数字决定了输出 1 到该数字的连续整数序列
// 关键点：
//   - 不足三位时，高位默认为 0，对应的循环不执行，不会输出任何字符。
// 时间复杂度：O(n)，其中 n 为输入数字的位数（最多 3 位），可视为 O(1)。
// 空间复杂度：O(1)。
#include <iostream>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    int hundreds = n / 100;
    int tens = (n / 10) % 10;
    int ones = n % 10;

    for (int i = 0; i < hundreds; ++i) cout << 'B';
    for (int i = 0; i < tens; ++i) cout << 'S';
    for (int i = 1; i <= ones; ++i) cout << i;

    cout << endl;
    return 0;
}