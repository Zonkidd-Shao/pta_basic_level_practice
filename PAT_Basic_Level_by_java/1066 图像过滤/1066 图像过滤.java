/**
 * 1066 图像过滤
 * 
 * 题目描述：
 * 图像过滤是把图像中某个颜色区间内的所有像素替换为指定颜色。
 * 给定图像的分辨率 M×N、待过滤的灰度区间 [A, B] 和替换灰度值 replace，
 * 输出过滤后的图像，每个像素值输出为 3 位数字（不足 3 位前面补 0）。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 逐行读取像素的灰度值。
 * 2. 对每个像素，判断其灰度值是否在区间 [A, B] 内，若是则替换为指定值。
 * 3. 使用 String.format("%03d", val) 将像素值格式化为 3 位数字，前面补 0。
 * 4. 每行像素之间用空格分隔。
 * 
 * 算法核心逻辑：逐像素判断 → 区间内替换 → 格式化输出。
 * 
 * 时间复杂度：O(M * N)，空间复杂度：O(N)（每行存储）。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        // 读取第一行：M（行数）、N（列数）、A（区间下限）、B（区间上限）、replace（替换灰度值）
        String[] firstLine = br.readLine().split(" ");
        int M = Integer.parseInt(firstLine[0]);
        int N = Integer.parseInt(firstLine[1]);
        int A = Integer.parseInt(firstLine[2]);
        int B = Integer.parseInt(firstLine[3]);
        int replace = Integer.parseInt(firstLine[4]);
        
        // 逐行处理图像像素
        for (int i = 0; i < M; i++) {
            String[] pixels = br.readLine().split(" ");
            StringBuilder sb = new StringBuilder();
            
            for (int j = 0; j < N; j++) {
                int val = Integer.parseInt(pixels[j]);
                
                // 如果灰度值在 [A, B] 区间内，则替换为指定值
                if (val >= A && val <= B) {
                    val = replace;
                }
                
                // 格式化为 3 位数字，前面补 0
                if (j > 0) {
                    sb.append(" ");
                }
                sb.append(String.format("%03d", val));
            }
            
            System.out.println(sb.toString());
        }
    }
}