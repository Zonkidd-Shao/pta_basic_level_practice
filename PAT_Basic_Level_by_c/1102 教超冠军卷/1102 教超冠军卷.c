/*
 * 题目：1102 教超冠军卷
 * 实现原理：
 *   找出销量最高和销售额最高的商品。
 *   算法步骤：
 *   1. 读取N个商品的信息（ID、单价、销量）
 *   2. 跟踪最大销量和对应的商品ID
 *   3. 跟踪最大销售额（单价*销量）和对应的商品ID
 *   4. 输出销量冠军和销售额冠军
 */
#include <stdio.h>
#include <string.h>

int main() {
    int N;
    scanf("%d", &N);    // 商品总数
    char sale_id[20], money_id[20]; // 分别记录销量冠军、销售额冠军的商品编号
    int max_sale = -1, max_money = -1;  // 当前最大销量与最大销售额
    for (int i = 0; i < N; i++) {
        char id[20];
        int price, count;
        scanf("%s %d %d", id, &price, &count);  // 读入编号、单价、销量
        if (count > max_sale) {     // 更新销量冠军
            max_sale = count;
            strcpy(sale_id, id);
        }
        int money = price * count;  // 计算该商品销售额
        if (money > max_money) {    // 更新销售额冠军
            max_money = money;
            strcpy(money_id, id);
        }
    }
    printf("%s %d\n", sale_id, max_sale);   // 输出销量冠军
    printf("%s %d\n", money_id, max_money); // 输出销售额冠军
    return 0;
}