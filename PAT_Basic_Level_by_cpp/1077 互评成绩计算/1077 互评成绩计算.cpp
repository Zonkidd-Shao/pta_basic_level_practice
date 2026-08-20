#include <cstdio>

int main() {
    int N, M;
    if (scanf("%d %d", &N, &M) != 2) return 0;
    for (int i = 0; i < N; ++i) {
        int g1;
        scanf("%d", &g1);
        int sum = 0, maxv = -1, minv = 101, cnt = 0;
        for (int j = 0; j < N - 1; ++j) {
            int score;
            scanf("%d", &score);
            if (score >= 0 && score <= M) {
                sum += score;
                cnt++;
                if (score > maxv) maxv = score;
                if (score < minv) minv = score;
            }
        }
        sum -= maxv + minv;
        cnt -= 2;
        double g2 = cnt > 0 ? (double)sum / cnt : 0;
        int final_score = (int)((g1 + g2) / 2 + 0.5);
        printf("%d\n", final_score);
    }
    return 0;
}
