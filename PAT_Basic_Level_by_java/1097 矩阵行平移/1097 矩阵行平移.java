/**
 * 1097 矩阵行平移
 * 
 * 题目描述：
 * 对一个 n×n 的矩阵，对奇数行（第1、3、5...行）依次循环平移，
 * 平移量按 1,2,...,k,1,2,... 循环，平移后左边空出的位置用指定值 x 填充，
 * 最后计算并输出每一列的和。
 * 
 * 实现原理：
 * 解题思路：逐行处理矩阵，对奇数行进行循环平移操作，最后按列求和输出。
 * 算法核心逻辑：
 *   1. 读取矩阵存入二维数组 matrix
 *   2. 遍历所有行，对奇数行（索引从0开始，i%2==0）进行平移：
 *      - 计算平移量 shift = (oddRowCount-1) % k + 1，循环取值 1,2,...,k
 *      - 创建新行，前 shift 个元素填充 x，后面元素从原行对应位置复制
 *   3. 遍历每一列，计算各列元素之和
 *   4. 按格式输出各列和（空格分隔，末尾换行）
 * 时间复杂度：O(n²)
 * 空间复杂度：O(n²)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().split(" ");
        int n = Integer.parseInt(firstLine[0]);
        int k = Integer.parseInt(firstLine[1]);
        int x = Integer.parseInt(firstLine[2]);
        
        // 读取原始矩阵
        int[][] matrix = new int[n][n];
        for (int i = 0; i < n; i++) {
            String[] parts = br.readLine().split(" ");
            for (int j = 0; j < n; j++) {
                matrix[i][j] = Integer.parseInt(parts[j]);
            }
        }
        
        // 对奇数行进行平移（第1、3、5...行，对应数组索引0、2、4...）
        int oddRowCount = 0;
        for (int i = 0; i < n; i++) {
            if (i % 2 == 0) { // 第1行（索引0）是奇数行
                oddRowCount++;
                // 平移量循环：1,2,...,k,1,2,...
                int shift = (oddRowCount - 1) % k + 1;
                // 向右平移 shift 位，左边补 x
                int[] newRow = new int[n];
                for (int j = 0; j < n; j++) {
                    if (j < shift) {
                        newRow[j] = x;             // 左边空出的位置填充 x
                    } else {
                        newRow[j] = matrix[i][j - shift]; // 原行元素右移
                    }
                }
                matrix[i] = newRow;
            }
        }
        
        // 计算每一列的和
        int[] colSum = new int[n];
        for (int j = 0; j < n; j++) {
            for (int i = 0; i < n; i++) {
                colSum[j] += matrix[i][j];
            }
        }
        
        // 输出结果（空格分隔）
        for (int j = 0; j < n; j++) {
            if (j > 0) {
                System.out.print(" ");
            }
            System.out.print(colSum[j]);
        }
        System.out.println();
    }
}