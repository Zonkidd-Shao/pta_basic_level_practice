/*
 * 1031 查验身份证
 *
 * 【实现原理】
 * 对输入的 18 位身份证号码进行校验。前 17 位是数字体号，第 18 位是校验码。
 * 校验规则：前 17 位分别乘以对应的权重值，求和后取模 11，根据余数查找校验码表。
 * 若计算出的校验码与第 18 位一致，则身份证号合法；否则非法。
 *
 * 【算法思路】
 * 1. 预定义权重数组 w[17] 和校验码字符串 "10X98765432"
 * 2. 对每个身份证号：
 *    a. 检查前 17 位是否均为数字
 *    b. 计算加权和 sum = Σ(id[j] - '0') * w[j]
 *    c. 校验码 expected = check[sum % 11]，与 id[17] 比较
 * 3. 若全部合法输出 "All passed"，否则按输入顺序输出所有非法号码
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N * 17) = O(N)，每个身份证只需常数次操作
 * - 空间复杂度：O(1)，仅使用常数个变量
 */

#include <iostream>
#include <string>

using namespace std;

int main() {
    int n;
    if (!(cin >> n)) return 0;

    // 前 17 位的权重系数
    int w[17] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
    // 校验码映射表：sum % 11 对应的校验码字符
    string check = "10X98765432";
    bool allPass = true;  // 标记是否所有号码都合法

    for (int i = 0; i < n; ++i) {
        string id;
        cin >> id;
        int sum = 0;
        bool valid = true;

        // 检查前 17 位是否为数字并计算加权和
        for (int j = 0; j < 17; ++j) {
            if (id[j] < '0' || id[j] > '9') {
                valid = false;  // 包含非数字字符，非法
                break;
            }
            sum += (id[j] - '0') * w[j];  // 加权求和
        }

        // 如果前 17 位合法，校验第 18 位校验码
        if (valid && check[sum % 11] != id[17]) {
            valid = false;  // 校验码不匹配
        }

        // 输出非法号码
        if (!valid) {
            cout << id << endl;
            allPass = false;
        }
    }

    // 全部合法则输出 All passed
    if (allPass) cout << "All passed" << endl;
    return 0;
}