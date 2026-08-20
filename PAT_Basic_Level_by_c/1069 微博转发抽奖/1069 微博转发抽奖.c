/*
 * 1069 微博转发抽奖 - 按昵称去重
 */
#include <stdio.h>
#include <string.h>

int main() {
    int M, N, S;
    scanf("%d %d %d", &M, &N, &S);
    char names[1000][21];
    for (int i = 0; i < M; i++) {
        scanf("%s", names[i]);
    }
    if (S > M) {
        printf("Keep going...\n");
        return 0;
    }
    char won[1000][21];
    int wonCnt = 0;
    int current = S - 1;
    int has_won = 0;
    while (current < M) {
        int duplicate = 0;
        for (int k = 0; k < wonCnt; k++) {
            if (strcmp(names[current], won[k]) == 0) {
                duplicate = 1;
                break;
            }
        }
        if (!duplicate) {
            printf("%s\n", names[current]);
            strcpy(won[wonCnt++], names[current]);
            has_won = 1;
            current += N;
        } else {
            current++;
        }
    }
    if (!has_won) {
        printf("Keep going...\n");
    }
    return 0;
}
