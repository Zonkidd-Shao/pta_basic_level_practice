#include <cstdio>

int main() {
    int n;
    if (scanf("%d", &n) != 1) return 0;
    char s[20];
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < 4; ++j) {
            scanf("%s", s);
            if (s[2] == 'T') {
                printf("%d", s[0] - 'A' + 1);
            }
        }
    }
    printf("\n");
    return 0;
}
