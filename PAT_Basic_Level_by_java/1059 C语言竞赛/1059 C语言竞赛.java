/**
 * 1059 C语言竞赛
 * 
 * 题目描述：
 * C语言竞赛的参赛者按排名获得不同奖品。给定参赛者人数 N 和他们的 ID，
 * 然后根据排名查询，输出对应的奖品：
 * - 排名第 1 的参赛者获得 "Mystery Award"（神秘大奖）
 * - 排名为素数的参赛者获得 "Minion"（小黄人）
 * - 其他参赛者获得 "Chocolate"（巧克力）
 * - 已被查询过的参赛者再次查询时输出 "Checked"
 * - 不存在的 ID 查询时输出 "Are you kidding?"
 * 
 * 实现原理：
 * 解题思路：
 * 1. 用 HashMap 存储 ID 到排名的映射关系，同时用数组 idArray 记录每个排名对应的 ID。
 * 2. 使用埃拉托色尼筛法（Sieve of Eratosthenes）预处理出 1~N 范围内的素数表。
 * 3. 对于每个查询，先检查 ID 是否存在，再检查是否已被查询过，最后根据排名输出对应奖品。
 * 
 * 算法核心逻辑：哈希表映射排名 → 素数筛预处理 → 按规则输出奖品。
 * 
 * 时间复杂度：O(N log log N + K)，空间复杂度：O(N)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());

        // 存储 ID 到排名的映射，以及排名到 ID 的映射
        Map<String, Integer> rankMap = new HashMap<>();
        boolean[] checked = new boolean[N + 1]; // 标记某个排名是否被查询过
        String[] idArray = new String[N + 1];

        // 读取参赛者 ID，按顺序分配排名
        for (int i = 1; i <= N; i++) {
            String id = br.readLine().trim();
            rankMap.put(id, i);
            idArray[i] = id;
        }

        // 埃拉托色尼筛法，预处理 1~N 的素数表
        boolean[] isPrime = new boolean[N + 1];
        for (int i = 2; i <= N; i++) {
            isPrime[i] = true;
        }
        for (int i = 2; i * i <= N; i++) {
            if (isPrime[i]) {
                // 将 i 的倍数标记为非素数
                for (int j = i * i; j <= N; j += i) {
                    isPrime[j] = false;
                }
            }
        }

        // 处理查询
        int K = Integer.parseInt(br.readLine().trim());
        for (int i = 0; i < K; i++) {
            String id = br.readLine().trim();
            if (!rankMap.containsKey(id)) {
                // ID 不存在
                System.out.println(id + ": Are you kidding?");
            } else {
                int rank = rankMap.get(id);
                if (checked[rank]) {
                    // 已被查询过
                    System.out.println(id + ": Checked");
                } else {
                    checked[rank] = true;
                    if (rank == 1) {
                        System.out.println(id + ": Mystery Award"); // 第1名：神秘大奖
                    } else if (isPrime[rank]) {
                        System.out.println(id + ": Minion"); // 素数排名：小黄人
                    } else {
                        System.out.println(id + ": Chocolate"); // 其他：巧克力
                    }
                }
            }
        }
    }
}