/**
 * 1045 快速排序
 * 
 * 题目描述：
 * 著名的快速排序算法中有一个经典划分过程：通常采用某种方法取一个元素作为主元（pivot），
 * 通过交换使得比主元小的元素放在左边、比主元大的放在右边。
 * 给定一个由 N 个不同正整数组成的排列，请找出所有可能作为主元的元素。
 * 主元的定义：左边的所有元素都比它小，右边的所有元素都比它大。
 * 输出这些元素的个数，并按升序输出这些元素。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 使用两个辅助数组 leftMax 和 rightMin 进行预处理：
 *    - leftMax[i] 表示从位置 0 到 i 的最大值
 *    - rightMin[i] 表示从位置 i 到 n-1 的最小值
 * 2. 遍历每个位置 i，若 a[i] 大于其左侧所有元素（即 a[i] > leftMax[i-1]）
 *    且小于其右侧所有元素（即 a[i] < rightMin[i+1]），则 a[i] 可作为主元。
 * 3. 收集所有主元后排序输出。
 * 
 * 核心思想：用空间换时间，通过预处理最大值和最小值数组，
 * 将 O(n²) 的暴力比较优化为 O(n)。主元在原序列中的位置即为其在排序后序列中的位置。
 * 
 * 时间复杂度：O(n log n)（主元排序输出），空间复杂度：O(n)
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        String[] parts = br.readLine().trim().split("\\s+");
        int[] a = new int[n];
        for (int i = 0; i < n; i++) a[i] = Integer.parseInt(parts[i]);

        // 预处理：leftMax[i] 记录位置 0~i 的最大值
        int[] leftMax = new int[n];
        leftMax[0] = a[0];
        for (int i = 1; i < n; i++) leftMax[i] = Math.max(leftMax[i - 1], a[i]);

        // 预处理：rightMin[i] 记录位置 i~n-1 的最小值
        int[] rightMin = new int[n];
        rightMin[n - 1] = a[n - 1];
        for (int i = n - 2; i >= 0; i--) rightMin[i] = Math.min(rightMin[i + 1], a[i]);

        // 遍历判断每个元素是否可作为主元
        ArrayList<Integer> res = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            boolean ok;
            if (i == 0) ok = a[i] < rightMin[i];          // 第一个元素只需比右侧都小
            else if (i == n - 1) ok = a[i] > leftMax[i]; // 最后一个元素只需比左侧都大
            else ok = a[i] > leftMax[i] && a[i] < rightMin[i];
            if (ok) res.add(a[i]);
        }

        // 按升序输出主元
        Collections.sort(res);
        StringBuilder sb = new StringBuilder();
        sb.append(res.size()).append('\n');
        for (int i = 0; i < res.size(); i++) {
            if (i > 0) sb.append(' ');
            sb.append(res.get(i));
        }
        sb.append('\n');
        System.out.print(sb);
    }
}
