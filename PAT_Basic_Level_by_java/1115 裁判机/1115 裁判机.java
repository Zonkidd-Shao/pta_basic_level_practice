/*
 * 1115 裁判机
 * 
 * 题目描述：
 *     游戏规则：裁判给出两个初始正整数，N 个玩家进行 M 轮游戏。
 *     每轮每个玩家依次报出一个数，该数必须满足：
 *       - 之前没有出现过（不在已出现的数字集合中）
 *       - 必须是集合中某两个数的差（即存在 a, b ∈ set 使 a - b = 该数）
 *     不满足条件的玩家出局。最后输出每轮出局的玩家和最终的赢家。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 使用 HashSet 存储所有已出现的数字。
 *       2. 对每个玩家每轮报出的数，判断是否已存在以及是否可表示为
 *          set 中某两个数的差。
 *       3. 判断差的逻辑：遍历 set 中的每个数 x，检查 x + num 是否也在 set 中。
 *       4. 出局的玩家标记为出局，后续轮次跳过。
 *     算法核心逻辑：
 *       - 差判断：对于数 num，遍历 set 中的 x，若 x + num 也在 set 中，
 *         则说明 num 可以表示为 (x + num) - x = num。
 *     时间复杂度：O(N * M * |set|)，最坏情况下 |set| 可达 O(N * M)。
 *     空间复杂度：O(N * M)，用于存储所有出现的数字。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        // 读取初始的两个正整数
        String[] initNums = br.readLine().split(" ");
        int num1 = Integer.parseInt(initNums[0]);
        int num2 = Integer.parseInt(initNums[1]);
        
        // 用 HashSet 存储所有已出现的数字
        Set<Integer> set = new HashSet<>();
        set.add(num1);
        set.add(num2);
        
        // 读取人数 N 和轮数 M
        String[] nm = br.readLine().split(" ");
        int n = Integer.parseInt(nm[0]);
        int m = Integer.parseInt(nm[1]);
        
        // 读取每个玩家在 M 轮中报出的所有数字
        int[][] nums = new int[n][m];
        for (int i = 0; i < n; i++) {
            String[] parts = br.readLine().split(" ");
            for (int j = 0; j < m; j++) {
                nums[i][j] = Integer.parseInt(parts[j]);
            }
        }
        
        // isOut[i] 表示第 i 个玩家是否已出局
        boolean[] isOut = new boolean[n];
        
        // 进行 M 轮游戏
        for (int round = 0; round < m; round++) {
            List<Integer> outThisRound = new ArrayList<>();
            
            // 每个玩家依次报数
            for (int player = 0; player < n; player++) {
                if (isOut[player]) {
                    continue; // 已出局的玩家跳过
                }
                
                int num = nums[player][round];
                
                // 检查是否合法：数字不能已存在，且必须是某两个已出现数字的差
                if (set.contains(num) || !isDifference(num, set)) {
                    isOut[player] = true;
                    outThisRound.add(player + 1); // 玩家编号从 1 开始
                } else {
                    set.add(num); // 合法数字加入集合
                }
            }
            
            // 输出本轮出局的玩家（按编号增序）
            for (int playerNum : outThisRound) {
                System.out.println("Round #" + (round + 1) + ": " + playerNum + " is out.");
            }
        }
        
        // 收集所有未出局的玩家（赢家）
        List<Integer> winners = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            if (!isOut[i]) {
                winners.add(i + 1);
            }
        }
        
        // 输出赢家
        if (winners.isEmpty()) {
            System.out.println("No winner.");
        } else {
            System.out.print("Winner(s):");
            for (int w : winners) {
                System.out.print(" " + w);
            }
            System.out.println();
        }
        
        br.close();
    }
    
    /**
     * 检查 num 是否可以表示为 set 中某两个数的差
     * 即是否存在 a, b ∈ set，使得 a - b = num
     * 等价于：遍历 set 中的每个 x，检查 x + num 是否也在 set 中
     * @param num 待检查的数
     * @param set 已出现的数字集合
     * @return true 表示可以表示为某两个数的差
     */
    private static boolean isDifference(int num, Set<Integer> set) {
        for (int x : set) {
            if (set.contains(x + num)) {
                return true; // (x + num) - x = num，且两个数都在集合中
            }
        }
        return false;
    }
}
