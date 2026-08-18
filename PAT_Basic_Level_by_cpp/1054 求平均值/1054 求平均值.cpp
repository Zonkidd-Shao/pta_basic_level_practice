// 1054 求平均值
//
// 实现原理：
// 从 N 个字符串中筛选出合法的实数，计算它们的平均值。合法数值需满足：
//   1. 在 [-1000, 1000] 范围内
//   2. 最多包含两位小数
// 非法字符串逐条输出错误信息，最后根据合法个数输出平均值。
//
// 校验函数 isValid 的算法：
//   逐字符扫描字符串，按状态机方式解析：
//   - 允许以 '+' 或 '-' 开头（但不能只有符号）
//   - 允许一个小数点，小数点后最多两位数字
//   - 其余字符必须为数字
//   若通过格式校验则调用 stod 转为 double，再检查值域范围。
//
// 复杂度分析：
// 时间复杂度：O(N*L)，其中 N 为字符串个数，L 为字符串平均长度。
// 空间复杂度：O(1)，只使用常数额外空间。
#include <iostream>
#include <string>
#include <cctype>
#include <cstdio>

using namespace std;

// 校验字符串是否为合法数值，并将值写入 val
// 合法条件：[-1000,1000] 范围内，最多两位小数
bool isValid(const string& s, double& val) {
    if (s.empty()) return false;
    size_t i = 0;
    // 处理可选的符号位
    if (s[0] == '+' || s[0] == '-') {
        if (s.size() == 1) return false;  // 只有符号无数字
        i = 1;
    }
    int digits = 0, afterDot = 0;
    bool hasDot = false;
    for (; i < s.size(); ++i) {
        if (s[i] == '.') {
            if (hasDot) return false;  // 多个小数点，非法
            hasDot = true;
        } else if (isdigit((unsigned char)s[i])) {
            if (hasDot) ++afterDot;    // 小数点后的数字位数
            else ++digits;             // 小数点前的数字位数
        } else {
            return false;               // 出现非法字符
        }
    }
    if (afterDot > 2) return false; // 最多两位小数
    val = stod(s);                   // 字符串转浮点数
    if (val < -1000.0 || val > 1000.0) return false;  // 检查值域
    return true;
}

int main() {
    int n;
    if (!(cin >> n)) return 0;

    int cnt = 0;
    double sum = 0.0;
    for (int i = 0; i < n; ++i) {
        string s;
        cin >> s;
        double v;
        if (isValid(s, v)) {
            ++cnt;
            sum += v;
        } else {
            // 对非法输入逐条报错
            cout << "ERROR: " << s << " is not a legal number" << endl;
        }
    }

    // 根据合法个数输出不同格式的平均值
    if (cnt == 0)
        cout << "The average of 0 numbers is Undefined" << endl;
    else if (cnt == 1)
        printf("The average of 1 number is %.2f\n", sum);
    else
        printf("The average of %d numbers is %.2f\n", cnt, sum / cnt);

    return 0;
}