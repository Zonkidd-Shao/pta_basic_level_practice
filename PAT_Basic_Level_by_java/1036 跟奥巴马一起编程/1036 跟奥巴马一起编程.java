import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1036 跟奥巴马一起编程
 *
 * 题目描述：
 * 用给定字符打印一个正方形边框图形。列数（即正方形的边长）为 N，行数（即高度）
 * 为 N/2 四舍五入取整。
 *
 * 实现原理：
 * 1. 按照题目要求，行数 = round(N / 2.0)，即 N 为偶数时行数为 N/2，N 为奇数
 *    时行数为 (N+1)/2。
 * 2. 使用双重循环逐行打印：
 *    - 第一行和最后一行全部输出字符（上边框和下边框）
 *    - 中间行的首列和末列输出字符，其余位置输出空格
 * 3. 这样即构成一个空心正方形的边框效果。
 *
 * 时间复杂度：O(N²)，双重循环遍历所有行列
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        int n = Integer.parseInt(parts[0]);
        char c = parts[1].charAt(0);
        // 行数 = N/2 四舍五入取整
        int rows = (int) Math.round(n / 2.0);
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < n; j++) {
                // 第一行、最后一行、第一列、最后一列输出字符，其余位置输出空格
                if (i == 0 || i == rows - 1 || j == 0 || j == n - 1) System.out.print(c);
                else System.out.print(' ');
            }
            System.out.println();
        }
    }
}
