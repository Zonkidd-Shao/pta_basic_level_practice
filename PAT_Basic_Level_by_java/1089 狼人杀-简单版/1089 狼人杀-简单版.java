import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1089 狼人杀-简单版
 * 
 * 题目描述：
 * 已知 N 名玩家中有 2 人扮演狼人，有 2 人说的不是实话（即说谎者）。
 * 说谎者中有且仅有 1 名狼人。要求找出可能的狼人编号。
 * 
 * 实现原理：
 * 解题思路：枚举所有可能的狼人组合 (i, j)，对每组假设验证是否满足条件。
 * 算法核心逻辑：
 *   1. 用数组 words 记录每个人说的话（正数指认好人，负数指认狼人）
 *   2. 双重循环枚举狼人组合 (i, j)，i 从 1 到 N，j 从 i+1 到 N（从小到大保证最小序列解）
 *   3. 内层循环遍历每个人 k 的发言，判断在当前假设下的真假：
 *      - 若 words[k] > 0，表示"该玩家是好人"，真话条件：该玩家不是狼人
 *      - 若 words[k] < 0，表示"该玩家是狼人"，真话条件：该玩家就是狼人
 *   4. 统计说谎人数 lieCount 和说谎的狼人数 wolfLieCount
 *   5. 当 lieCount == 2 且 wolfLieCount == 1 时即找到符合条件的一组解
 * 时间复杂度：O(N³)，其中 N 为玩家数量
 * 空间复杂度：O(N)
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());
        int[] words = new int[N + 1];
        
        for (int i = 1; i <= N; i++) {
            words[i] = Integer.parseInt(br.readLine().trim());
        }
        
        for (int i = 1; i <= N; i++) {
            for (int j = i + 1; j <= N; j++) {
                int lieCount = 0;
                int wolfLieCount = 0;
                
                for (int k = 1; k <= N; k++) {
                    int x = words[k];
                    boolean isTruth;
                    
                    if (x > 0) {
                        isTruth = (x != i && x != j);
                    } else {
                        int absX = -x;
                        isTruth = (absX == i || absX == j);
                    }
                    
                    if (!isTruth) {
                        lieCount++;
                        if (k == i || k == j) {
                            wolfLieCount++;
                        }
                    }
                }
                
                if (lieCount == 2 && wolfLieCount == 1) {
                    System.out.println(i + " " + j);
                    return;
                }
            }
        }
        
        System.out.println("No Solution");
    }
}
