import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1008 数组元素循环右移问题
 *
 * 题目描述：
 * 给定 N 个整数，将数组中的元素循环向右移动 M 个位置（不允许使用另外的数组），
 * 输出移动后的序列。注意：M 可能大于 N，需先取模处理。
 *
 * 实现原理：
 * 使用"三次反转"（Reversal Algorithm）实现原地循环右移，无需额外数组：
 * 1. 先将整个数组反转；
 * 2. 再将前 M 个元素反转；
 * 3. 最后将后 N-M 个元素反转。
 * 这样即可得到循环右移 M 位的结果。
 * 例如 [1,2,3,4,5] 右移 2 位：反转全部→[5,4,3,2,1]，反转前2→[4,5,3,2,1]，反转后3→[4,5,1,2,3]。
 * 时间复杂度 O(N)，空间复杂度 O(1)。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] first = br.readLine().trim().split("\\s+");
        int n = Integer.parseInt(first[0]);      // 数组元素个数
        int m = Integer.parseInt(first[1]) % n;  // 实际右移位数（处理 M ≥ N 的情况）
        String[] second = br.readLine().trim().split("\\s+");
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) arr[i] = Integer.parseInt(second[i]);
        // 三次反转实现原地循环右移
        reverse(arr, 0, n - 1);     // 步骤1：反转整个数组
        reverse(arr, 0, m - 1);     // 步骤2：反转前 m 个元素
        reverse(arr, m, n - 1);     // 步骤3：反转剩余 n-m 个元素
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) {
            if (i > 0) sb.append(' ');
            sb.append(arr[i]);
        }
        System.out.println(sb.toString());
    }

    // 反转数组指定区间 [l, r] 内的元素
    private static void reverse(int[] a, int l, int r) {
        while (l < r) {
            int t = a[l];           // 交换 a[l] 和 a[r]
            a[l] = a[r];
            a[r] = t;
            l++;
            r--;
        }
    }
}
