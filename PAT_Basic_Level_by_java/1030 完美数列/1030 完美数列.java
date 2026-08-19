/*
 * 题目编号：1030 完美数列
 * 
 * 题目描述：
 *   给定一个正整数数列，和一个正整数 p，设数列中最大值为 M，最小值为 m，
 *   如果能满足 M <= m * p，则称该数列为"完美数列"。
 *   从给定数列中选出尽可能多的数构成一个完美数列，输出最多能选出的数字个数。
 *
 * 实现原理：
 *   解题思路：先将数列排序，然后使用双指针（滑动窗口）法遍历排序后的数组。
 *   对于每个左边界 i（作为最小值 m），维护右指针 j 向右移动直到 a[j] > a[i] * p，
 *   此时 j-i 即为以 i 为最小值的最大子序列长度，取所有 i 中 j-i 的最大值。
 *   算法核心逻辑：
 *     1. 将原数组从小到大排序。
 *     2. 初始化左指针 i = 0，右指针 j = 0。
 *     3. 对于每个 i，将 j 不断右移直到 a[j] > a[i] * p，则区间 [i, j-1] 构成完美数列。
 *     4. 更新最大长度 maxLen = max(maxLen, j - i)。
 *     5. 注意使用 long 类型存储数值，防止 a[i] * p 溢出 int 范围。
 *   时间复杂度：O(n log n)，排序占主导，双指针遍历 O(n)。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] first = br.readLine().trim().split("\\s+");
        int n = Integer.parseInt(first[0]);
        long p = Long.parseLong(first[1]);

        String[] nums = br.readLine().trim().split("\\s+");
        long[] a = new long[n];
        for (int i = 0; i < n; i++) {
            a[i] = Long.parseLong(nums[i]);
        }

        // 从小到大排序
        Arrays.sort(a);

        int maxLen = 0;
        int j = 0; // 双指针中的右指针

        // 遍历每个左指针 i（作为最小值）
        for (int i = 0; i < n; i++) {
            // 右指针 j 向右移动，直到 a[j] > a[i] * p
            while (j < n && a[j] <= a[i] * p) j++;
            // 以 i 为最小值的完美数列长度为 j - i
            maxLen = Math.max(maxLen, j - i);
        }

        System.out.println(maxLen);
    }
}
