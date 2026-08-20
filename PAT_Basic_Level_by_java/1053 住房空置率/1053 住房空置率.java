/**
 * 1053 住房空置率
 * 
 * 题目描述：
 * 在不打扰居民的前提下，统计住房空置率的一种方法是根据每户用电量的连续变化规律进行判断。
 * 判断标准如下：
 * 1. 在观察期内，若存在超过一半的日子用电量低于某阈值 e，则该住房为"可能空置"。
 * 2. 若"可能空置"且观察期超过 D 天，则该住房为"空置"。
 * 给定 N 户居民的用电数据，输出"可能空置"户数和"空置"户数各占 N 的百分比，
 * 结果保留 1 位小数，百分比符号 % 紧跟数字。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 读取 N、阈值 e、临界天数 D。
 * 2. 对每户居民，统计用电量低于 e 的天数 lowCount。
 * 3. 若 lowCount > K/2（超过一半），则该户为"可能空置"，possibleEmpty 加 1；
 *    若同时满足 K > D，则该户为"空置"，empty 也加 1。
 * 4. 计算百分比：possibleRate = possibleEmpty × 100 / N，emptyRate = empty × 100 / N。
 * 5. 按格式输出，百分号前保留 1 位小数。
 * 
 * 核心思想：直接统计模拟，按规则逐户判断。
 * 
 * 时间复杂度：O(ΣKᵢ)，其中 Kᵢ 为每户的观察天数，空间复杂度：O(1)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        // 读取第一行：N, e, D
        String[] firstLine = br.readLine().split(" ");
        int N = Integer.parseInt(firstLine[0]);
        double e = Double.parseDouble(firstLine[1]);
        int D = Integer.parseInt(firstLine[2]);
        
        int possibleEmpty = 0; // 可能空置的数量
        int empty = 0;         // 空置的数量
        
        for (int i = 0; i < N; i++) {
            String[] line = br.readLine().split(" ");
            int K = Integer.parseInt(line[0]);          // 该户观察天数
            int lowCount = 0;                             // 低于阈值的天数统计
            
            // 统计用电量低于 e 的天数
            for (int j = 1; j <= K; j++) {
                double elec = Double.parseDouble(line[j]);
                if (elec < e) {
                    lowCount++;
                }
            }
            
            // 判断是否超过一半的日子用电量低于阈值
            if (lowCount > K / 2.0) {
                if (K > D) {
                    empty++;
                } else {
                    possibleEmpty++;
                }
            }
        }
        
        // 计算百分比，保留1位小数
        double possibleRate = possibleEmpty * 100.0 / N;
        double emptyRate = empty * 100.0 / N;
        
        System.out.printf("%.1f%% %.1f%%\n", possibleRate, emptyRate);
    }
}
