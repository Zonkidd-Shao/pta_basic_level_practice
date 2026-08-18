// 1068 万绿丛中一点红
//
// 实现原理：
// 在 M×N 的图像中找出满足以下条件的"一点红"像素：
//   1. 该像素的颜色值在全图中唯一（只出现一次）
//   2. 该像素与周围 8-邻域像素的颜色差绝对值均大于阈值 TOL
// 若有且仅有一个这样的像素，输出其颜色值和坐标（1-based）；
// 若无则输出"Not Exist"；有多个则输出"Not Unique"。
//
// 算法步骤：
// 1. 读取图像，使用 map 统计每种颜色出现的次数
// 2. 对每个像素：
//    a. 检查颜色是否唯一（cnt[img[i][j]] == 1）
//    b. 检查与 8-邻域的色差是否均 > TOL（边界处只检查存在的邻域）
// 3. 统计满足条件的像素个数，按规则输出
//
// 复杂度分析：
// 时间复杂度：O(N*M)，遍历所有像素一遍，每个像素检查最多 8 个邻域。
// 空间复杂度：O(N*M + K)，N*M 为图像存储，K 为不同颜色数。
#include <iostream>
#include <vector>
#include <map>
#include <cmath>

using namespace std;

int main() {
    int m, n, tol;
    if (!(cin >> m >> n >> tol)) return 0;

    // 读入图像，同时统计每种颜色出现次数
    vector<vector<long long>> img(n, vector<long long>(m));
    map<long long, int> cnt;
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < m; ++j) {
            cin >> img[i][j];
            ++cnt[img[i][j]];
        }

    int found = 0;
    long long color = 0;
    int fr = 0, fc = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (cnt[img[i][j]] != 1) continue;  // 颜色不唯一，跳过
            bool ok = true;
            // 检查 8-邻域
            for (int di = -1; di <= 1 && ok; ++di)
                for (int dj = -1; dj <= 1; ++dj) {
                    if (di == 0 && dj == 0) continue;
                    int ni = i + di, nj = j + dj;
                    // 越界的邻域不检查
                    if (ni < 0 || ni >= n || nj < 0 || nj >= m) continue;
                    // 色差绝对值 <= TOL 则不满足条件
                    if (llabs(img[i][j] - img[ni][nj]) <= tol) { ok = false; break; }
                }
            if (ok) {
                ++found;
                color = img[i][j];
                fr = i + 1; fc = j + 1;  // 转换为 1-based 坐标
            }
        }
    }

    // 根据找到的个数输出对应结果
    if (found == 1) cout << color << " (" << fr << ", " << fc << ")" << endl;
    else if (found == 0) cout << "Not Exist" << endl;
    else cout << "Not Unique" << endl;
    return 0;
}