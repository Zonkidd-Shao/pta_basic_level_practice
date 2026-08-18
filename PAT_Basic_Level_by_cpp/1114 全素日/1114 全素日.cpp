/*
 * 1114 全素日
 *
 * 【实现原理】
 * 题目给定一个日期字符串（格式如 yyyymmdd，共 8 位数字），判断其每一位数字
 * 是否都是素数数字（即 2、3、5、7 这四个数字）。若所有数字均为素数数字，
 * 则该日期为"全素日"，输出 "Yes"，否则输出 "No"。
 *
 * 【算法思路】
 * 1. 从日期字符串中提取所有数字字符。
 * 2. 定义 isPrimeDigit() 函数判断一个数字字符是否为 2、3、5、7 之一。
 * 3. 遍历所有数字字符，若存在非素数数字，则标记为 false 并退出。
 * 4. 根据结果输出 "Yes" 或 "No"。
 *
 * 【复杂度分析】
 * - 时间复杂度：O(L)，其中 L 为日期字符串长度（固定为 8）。
 * - 空间复杂度：O(1)，仅使用常数个变量。
 */
#include <iostream>
#include <string>

using namespace std;

/*
 * 判断一个数字字符是否为素数数字（2, 3, 5, 7）
 */
bool isPrimeDigit(char c) {
    return c == '2' || c == '3' || c == '5' || c == '7';
}

int main() {
    string date;
    if (!(cin >> date)) return 0;
    string digits;
    for (char c : date) if (isdigit((unsigned char)c)) digits += c; // 提取数字部分
    bool allPrime = true;
    for (char c : digits) if (!isPrimeDigit(c)) { allPrime = false; break; }
    cout << (allPrime ? "Yes" : "No") << endl;
    return 0;
}