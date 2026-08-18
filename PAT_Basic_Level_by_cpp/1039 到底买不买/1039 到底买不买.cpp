/*
 * 1039 到底买不买
 *
 * 【实现原理】
 * 店家有一串珠子（每个珠子有颜色），小红想要一串特定颜色序列的珠子。
 * 判断店家的珠子是否能满足小红的需求：
 * - 若能满足（即店家的珠子包含目标串中所有颜色的珠子），输出 Yes 及多余珠子数
 * - 若不能满足，输出 No 及缺少的珠子数
 *
 * 【算法思路】
 * 1. 统计店家各种颜色珠子的数量，存入计数数组 cnt
 * 2. 遍历目标串中的每个珠子：
 *    - 若 cnt 中对应颜色还有剩余，则消耗一个（cnt--）
 *    - 若 cnt 中对应颜色已无剩余，则 missing++
 * 3. 根据 missing 是否为 0 输出相应结果
 *
 * 【关键点】
 * - 使用大小为 256 的计数数组，覆盖所有 ASCII 字符
 * - 店家珠子总数 - 目标珠子总数 = 多余珠子数（当满足时）
 * - 珠子颜色由字母或数字表示，题目隐含字符范围在 ASCII 内
 *
 * 【复杂度分析】
 * - 时间复杂度：O(N + M)，N 为店家珠子数，M 为目标珠子数
 * - 空间复杂度：O(1)，固定 256 大小的数组
 */

#include <iostream>
#include <string>

using namespace std;

int main() {
    string shop, want;
    if (!(cin >> shop >> want)) return 0;

    int cnt[256] = {0};  // 统计店家每种颜色珠子的数量
    for (char c : shop) ++cnt[(unsigned char)c];

    int missing = 0;  // 缺少的珠子数
    for (char c : want) {
        if (cnt[(unsigned char)c] > 0) {
            --cnt[(unsigned char)c];  // 有该颜色珠子，消耗一颗
        } else {
            ++missing;  // 没有该颜色珠子，缺少数加一
        }
    }

    // missing == 0 表示所有珠子都满足
    if (missing == 0) {
        // 多余珠子数 = 店家的珠子总数 - 目标珠子总数
        cout << "Yes " << (shop.size() - want.size()) << endl;
    } else {
        cout << "No " << missing << endl;
    }
    return 0;
}