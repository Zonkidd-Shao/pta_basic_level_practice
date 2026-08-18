import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 1090 危险品装箱
 * 
 * 题目描述：
 * 给定一批不相容的物品对，对每箱货物检查是否存在不相容的物品放在同一箱中。
 * 若存在不相容对则输出 No，否则输出 Yes。
 * 
 * 实现原理：
 * 解题思路：用 HashMap 建立每个物品的不相容物品列表，对每箱货物用 HashSet
 *   存储箱中物品，遍历检查是否有不相容物品同时出现在箱中。
 * 算法核心逻辑：
 *   1. 读取 N 对不相容物品，构建邻接表：每个物品映射到其所有不相容物品列表
 *   2. 对每箱货物，将 K 个物品存入 HashSet
 *   3. 遍历该 HashSet 中的每个物品 g：
 *      - 若 g 有不相容物品列表，则遍历列表检查是否有物品也在 HashSet 中
 *      - 若发现冲突，标记不安全并跳出
 *   4. 根据安全标记输出 "Yes" 或 "No"
 * 时间复杂度：O(N + M×K²)，其中 N 为不相容对数，M 为箱数，K 为每箱物品数
 * 空间复杂度：O(N + M×K)
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split(" ");
        int N = Integer.parseInt(firstLine[0]);
        int M = Integer.parseInt(firstLine[1]);
        
        Map<Integer, List<Integer>> incompatible = new HashMap<>();
        
        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split(" ");
            int a = Integer.parseInt(parts[0]);
            int b = Integer.parseInt(parts[1]);
            
            if (!incompatible.containsKey(a)) {
                incompatible.put(a, new ArrayList<>());
            }
            incompatible.get(a).add(b);
            
            if (!incompatible.containsKey(b)) {
                incompatible.put(b, new ArrayList<>());
            }
            incompatible.get(b).add(a);
        }
        
        for (int i = 0; i < M; i++) {
            String[] parts = br.readLine().trim().split(" ");
            int K = Integer.parseInt(parts[0]);
            Set<Integer> goods = new HashSet<>();
            
            for (int j = 0; j < K; j++) {
                goods.add(Integer.parseInt(parts[1 + j]));
            }
            
            boolean safe = true;
            for (int g : goods) {
                if (incompatible.containsKey(g)) {
                    for (int bad : incompatible.get(g)) {
                        if (goods.contains(bad)) {
                            safe = false;
                            break;
                        }
                    }
                }
                if (!safe) {
                    break;
                }
            }
            
            System.out.println(safe ? "Yes" : "No");
        }
    }
}
