/*
 * 题目：1090 危险品装箱
 * 实现原理：
 *   判断一批货物是否可以安全装箱。如果货物中存在互为危险品的组合，则不安全。
 *   算法步骤：
 *   1. 使用邻接表存储危险品配对关系（conflict[x]存储与x冲突的物品列表）
 *   2. 读取m批货物，每批货物包含k件物品
 *   3. 使用exists数组标记当前批次已有的物品
 *   4. 对于每件物品，检查其冲突物品是否已在当前批次中
 *   5. 如果发现冲突，标记为不安全
 */
#include <stdio.h>

#define MAX_ID 100000
#define MAX_EDGES 20000

typedef struct {
    int to;
    int next;
} Edge;

int main() {
    int n, m;           // n:危险品配对组数; m:装箱批次
    scanf("%d %d", &n, &m);
    int head[MAX_ID];
    Edge edges[MAX_EDGES];
    int edge_count = 0;
    for (int i = 0; i < MAX_ID; i++) head[i] = -1;
    for (int i = 0; i < n; i++) {
        int x, y;
        scanf("%d %d", &x, &y);
        edges[edge_count] = (Edge){y, head[x]};
        head[x] = edge_count++;
        edges[edge_count] = (Edge){x, head[y]};
        head[y] = edge_count++;
    }
    for (int i = 0; i < m; i++) {
        int k;
        scanf("%d", &k);
        int exists[100000] = {0};   // exists[g]标记货物g是否已在本批出现
        int safe = 1;               // 是否安全
        for (int j = 0; j < k; j++) {
            int g;
            scanf("%d", &g);
            for (int edge = head[g]; edge != -1; edge = edges[edge].next) {
                if (exists[edges[edge].to]) {                // 冲突物品已在箱中则不安全
                    safe = 0;
                    break;
                }
            }
            exists[g] = 1;
        }
        if (safe) {
            printf("Yes\n");
        } else {
            printf("No\n");
        }
    }
    return 0;
}
