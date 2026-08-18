import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 1068 万绿丛中一点红
 *
 * 题目描述：
 * 给定一幅分辨率为M×N的图像，每个像素点有一个颜色值（0~2^24之间的整数）。
 * 需要找出"万绿丛中一点红"——即像素值独一无二（在整个图像中只出现一次），
 * 且该像素点与周围8个相邻像素点的颜色差绝对值均超过阈值TOL。
 * 如果存在多个满足条件的点，输出"Not Unique"；如果没有，输出"Not Exist"；
 * 恰好有一个，则输出其坐标和颜色值。
 *
 * 实现原理：
 * 解题思路：
 * 1. 使用HashMap统计每个颜色值在整幅图像中出现的次数
 * 2. 遍历每个像素，先判断其颜色是否唯一（出现次数为1）
 * 3. 对唯一颜色的像素，检查其周围8个方向（上、下、左、右、对角线）的相邻像素
 * 4. 若某个相邻像素的色差绝对值≤TOL，则判定为不满足条件
 * 5. 统计满足条件的像素点数量，按要求输出结果
 *
 * 算法核心逻辑：
 * - 使用方向数组dx/dy遍历8个邻域，避免重复编写边界检查代码
 * - 边界像素只需检查实际存在的相邻像素（通过范围判断ni>=0 && ni<N && nj>=0 && nj<M）
 * - 先判断颜色唯一性再检查色差，减少不必要的计算
 *
 * 时间复杂度：O(N×M)，遍历所有像素点各一次
 * 空间复杂度：O(N×M + U)，其中U为不同颜色值的数量
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split("\\s+");
        int M = Integer.parseInt(firstLine[0]);
        int N = Integer.parseInt(firstLine[1]);
        int TOL = Integer.parseInt(firstLine[2]);

        int[][] pixels = new int[N][M];  // 存储所有像素点的颜色值
        Map<Integer, Integer> colorCount = new HashMap<>();  // 统计每种颜色出现的次数

        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split("\\s+");
            for (int j = 0; j < M; j++) {
                pixels[i][j] = Integer.parseInt(parts[j]);
                // 统计颜色出现次数，用于后续判断颜色是否唯一
                colorCount.put(pixels[i][j], colorCount.getOrDefault(pixels[i][j], 0) + 1);
            }
        }

        int count = 0;  // 满足条件的像素点个数
        int resultX = 0, resultY = 0, resultColor = 0;  // 记录结果位置和颜色

        // 8个方向的偏移量：左上、上、右上、左、右、左下、下、右下
        int[] dx = {-1, -1, -1, 0, 0, 1, 1, 1};
        int[] dy = {-1, 0, 1, -1, 1, -1, 0, 1};

        for (int i = 0; i < N; i++) {
            for (int j = 0; j < M; j++) {
                int color = pixels[i][j];
                // 第一步：颜色必须在整个图像中唯一
                if (colorCount.get(color) != 1) {
                    continue;
                }
                // 第二步：检查与周围8个像素的色差是否都超过阈值
                boolean valid = true;
                for (int k = 0; k < 8; k++) {
                    int ni = i + dx[k];  // 相邻像素的行坐标
                    int nj = j + dy[k];  // 相邻像素的列坐标
                    // 只检查在图像范围内的相邻像素
                    if (ni >= 0 && ni < N && nj >= 0 && nj < M) {
                        int diff = Math.abs(color - pixels[ni][nj]);
                        if (diff <= TOL) {  // 色差不超过阈值，不满足条件
                            valid = false;
                            break;
                        }
                    }
                }
                if (valid) {
                    count++;
                    resultX = j + 1;  // 列号从1开始
                    resultY = i + 1;  // 行号从1开始
                    resultColor = color;
                }
            }
        }

        if (count == 0) {
            System.out.println("Not Exist");
        } else if (count == 1) {
            System.out.printf("(%d, %d): %d\n", resultX, resultY, resultColor);
        } else {
            System.out.println("Not Unique");
        }
    }
}
