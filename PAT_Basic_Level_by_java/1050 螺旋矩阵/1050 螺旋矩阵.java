/**
 * 1050 螺旋矩阵
 * 
 * 题目描述：
 * 给定 N 个正整数，将它们按非递增顺序填入一个 m 行 n 列的螺旋矩阵中（顺时针方向）。
 * 螺旋矩阵是指从左上角第一个格子开始，按顺时针方向螺旋填充。
 * 要求 m × n = N，且 m ≥ n，m - n 取所有可能值中的最小值。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 排序：将输入数组降序排列，以便从大到小依次填入矩阵。
 * 2. 确定矩阵尺寸：从 sqrt(N) 向下查找第一个能被 N 整除的数作为列数 n，
 *    则行数 m = N / n。这样保证 m ≥ n 且 m - n 最小。
 * 3. 模拟螺旋填充：使用四个边界指针 left/right/top/bottom，
 *    按右→下→左→上的顺序循环填充，每完成一个方向就收缩对应的边界。
 * 4. 当 left > right 或 top > bottom 时填充结束。
 * 
 * 核心思想：矩阵模拟 + 双指针边界控制，按顺时针螺旋顺序逐个填入已排序的元素。
 * 
 * 时间复杂度：O(N log N)（排序），空间复杂度：O(N)
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int total = Integer.parseInt(br.readLine().trim());
        String[] parts = br.readLine().trim().split("\\s+");
        int[] a = new int[total];
        for (int i = 0; i < total; i++) a[i] = Integer.parseInt(parts[i]);

        // 降序排列
        Arrays.sort(a);
        int[] desc = new int[total];
        for (int i = 0; i < total; i++) desc[i] = a[total - 1 - i];

        // 确定列数 n（从 sqrt(total) 向下找第一个能整除的）
        int cols = (int) Math.sqrt(total);
        while (total % cols != 0) cols--;
        int rows = total / cols;                  // 行数 m

        // 顺时针螺旋填充
        int[][] mat = new int[rows][cols];
        int left = 0, right = cols - 1, top = 0, bottom = rows - 1, idx = 0;
        while (left <= right && top <= bottom) {
            // 向右：填充上边界
            for (int j = left; j <= right; j++) mat[top][j] = desc[idx++];
            top++;
            // 向下：填充右边界
            for (int i = top; i <= bottom; i++) mat[i][right] = desc[idx++];
            right--;
            // 向左：填充下边界（需确保还有行）
            if (top <= bottom) {
                for (int j = right; j >= left; j--) mat[bottom][j] = desc[idx++];
                bottom--;
            }
            // 向上：填充左边界（需确保还有列）
            if (left <= right) {
                for (int i = bottom; i >= top; i--) mat[i][left] = desc[idx++];
                left++;
            }
        }

        // 输出矩阵
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (j > 0) sb.append(' ');
                sb.append(mat[i][j]);
            }
            sb.append('\n');
        }
        System.out.print(sb);
    }
}
