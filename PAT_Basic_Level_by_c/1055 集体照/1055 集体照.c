/*
 * 题目：1055 集体照
 * 实现原理：
 *   将人员按身高从高到低排列，分成K行拍摄集体照。
 *   排列规则：
 *   1. 第一行人数 = N/K + N%K，其余行人数 = N/K
 *   2. 每行从中间向两边穿插排列（先右后左）
 *   算法步骤：
 *   1. 按身高降序排序（身高相同按姓名升序）
 *   2. 逐行处理，计算每行人数
 *   3. 使用穿插法填充每行：从中间位置开始，交替向右、向左移动
 *   4. 按行输出姓名
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char name[9];
    int height;
} Person;

int cmp(const void *a, const void *b) {  // 排序规则：身高降序，身高相同按姓名升序
    Person *A = (Person *)a;
    Person *B = (Person *)b;
    if (A->height != B->height) {
        return B->height - A->height;
    } else {
        return strcmp(A->name, B->name);
    }
}

int main() {
    int N, K;
    scanf("%d %d", &N, &K);
    Person arr[10000];
    for (int i = 0; i < N; i++) {  // 读入所有人的姓名与身高
        scanf("%s %d", arr[i].name, &arr[i].height);
    }
    qsort(arr, N, sizeof(Person), cmp);  // 按身高从高到低排序
    
    int index = 0;  // 当前行在排序后数组中的起始下标
    for (int j = 0; j < K; j++) {  // 从最后一排往前逐行安排
        int m;  // 本行人数
        if (j == 0) {           // 最后一排（第一行）多出 N%K 人
            m = N / K + N % K;
        } else {
            m = N / K;
        }
        
        char row[10000][9];  // 本行按最终站位顺序存放姓名
        int mid = m / 2;     // 最高的人站在中间位置
        strcpy(row[mid], arr[index].name);
        int left = mid - 1, right = mid + 1;
        for (int i = 1; i < m; i++) {  // 按从高到低依次向两边穿插：先左后右
            if (i % 2 == 1) {
                strcpy(row[left--], arr[index + i].name);  // 奇数位放左侧
            } else {
                strcpy(row[right++], arr[index + i].name); // 偶数位放右侧
            }
        }
        
        for (int i = 0; i < m; i++) {  // 输出本行（空格分隔，行尾无多余空格）
            printf("%s", row[i]);
            if (i < m - 1) printf(" ");
        }
        printf("\n");
        index += m;  // 指向下一行起始位置
    }
    return 0;
}