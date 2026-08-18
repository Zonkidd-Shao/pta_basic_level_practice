/*
 * 1112 超标区间
 * 
 * 题目描述：
 *     给定 N 个数据点和一个阈值 T，找出所有连续的数据点均超过 T 的区间
 *     （即该区间内每个数据点的值都大于 T）。
 *     如果没有超标数据，则输出所有数据中的最大值。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 遍历数据数组，同时维护当前遇到的最大值。
 *       2. 当遇到一个大于 T 的数据点时，标记为区间起点，继续向后
 *          遍历直到遇到不大于 T 的数据点，标记为区间终点。
 *       3. 记录该区间，继续向后扫描。
 *       4. 如果没有任何区间，则输出最大值；否则输出所有区间。
 *     算法核心逻辑：
 *       - 单次遍历，线性扫描，一次遍历即可找出所有连续超标区间。
 *     时间复杂度：O(n)，其中 n 为数据点个数。
 *     空间复杂度：O(k)，k 为超标区间个数，最坏情况下 O(n)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        // 读取第一行：N（数据点个数）和 T（阈值）
        String[] firstLine = br.readLine().split(" ");
        int n = Integer.parseInt(firstLine[0]);
        int t = Integer.parseInt(firstLine[1]);
        
        // 读取第二行：N 个数据点
        String[] dataStr = br.readLine().split(" ");
        int[] data = new int[n];
        for (int i = 0; i < n; i++) {
            data[i] = Integer.parseInt(dataStr[i]);
        }
        
        // 存储所有超标区间 [start, end]
        List<int[]> intervals = new ArrayList<>();
        int maxVal = data[0]; // 记录所有数据中的最大值
        
        int i = 0;
        while (i < n) {
            // 更新最大值
            if (data[i] > maxVal) {
                maxVal = data[i];
            }
            
            // 如果当前数据点超标（大于阈值 T）
            if (data[i] > t) {
                int start = i;
                // 连续扫描，找到所有连续超标的数据点
                while (i < n && data[i] > t) {
                    i++;
                }
                int end = i - 1; // 区间终点
                intervals.add(new int[]{start, end});
            } else {
                i++;
            }
        }
        
        // 输出结果
        if (intervals.isEmpty()) {
            // 没有超标数据，输出所有数据中的最大值
            System.out.println(maxVal);
        } else {
            // 输出每个超标区间，格式为 [start, end]
            for (int[] interval : intervals) {
                System.out.println("[" + interval[0] + ", " + interval[1] + "]");
            }
        }
        
        br.close();
    }
}
