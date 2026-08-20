/*
 * 题目：1020 月饼
 * 实现原理：
 *   给定月饼的库存量和总售价，求最大收益。采用贪心算法：
 *   1. 计算每种月饼的单价（总售价/库存量）
 *   2. 按单价从高到低排序
 *   3. 优先出售单价高的月饼，直到库存用完或需求满足
 *   算法步骤：
 *   - 使用qsort按单价降序排序
 *   - 遍历排序后的月饼，累加收益
 *   - 若当前月饼库存不足需求，则取全部库存；否则取所需数量
 *   使用double类型处理浮点数，注意精度问题。
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct {
    double stock;       // 库存量（万吨）
    double price;       // 总售价
    double unit_price;  // 单价（总售价 / 库存量）
} Mooncake;

int cmp(const void *a, const void *b) {         // 按单价从高到低排序
    Mooncake *m1 = (Mooncake *)a;
    Mooncake *m2 = (Mooncake *)b;
    if (m1->unit_price < m2->unit_price) return 1;
    if (m1->unit_price > m2->unit_price) return -1;
    return 0;
}

int main() {
    int n;
    double d;                                   // 市场需求量（万吨）
    scanf("%d %lf", &n, &d);
    Mooncake cakes[1000];
    for (int i = 0; i < n; i++) {               // 读入每种月饼的库存量
        scanf("%lf", &cakes[i].stock);
    }
    for (int i = 0; i < n; i++) {               // 读入总售价并计算单价
        scanf("%lf", &cakes[i].price);
        cakes[i].unit_price = cakes[i].price / cakes[i].stock;
    }
    qsort(cakes, n, sizeof(Mooncake), cmp);     // 按单价降序排列
    double profit = 0;
    for (int i = 0; i < n && d > 0; i++) {      // 优先卖单价高的，直到需求满足
        if (cakes[i].stock <= d) {              // 库存不足以满足剩余需求：全部卖出
            profit += cakes[i].price;
            d -= cakes[i].stock;
        } else {                                // 库存充足：只卖需求所需的量
            profit += cakes[i].unit_price * d;
            d = 0;
        }
    }
    printf("%.2f\n", profit);                   // 输出最大收益，保留两位小数
    return 0;
}