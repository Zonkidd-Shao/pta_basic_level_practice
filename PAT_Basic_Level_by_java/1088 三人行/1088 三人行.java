import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1088 三人行
 * 
 * 题目描述：
 * 甲、乙、丙三人的能力值满足以下关系：
 * 1. 甲是两位数
 * 2. 乙是甲的各位数字反转
 * 3. 丙 = 甲/乙（小数），|甲-乙| = X × 丙，乙 = Y × 丙
 * 给定你的能力值 M 和正整数 X、Y，求甲的能力值，
 * 并将甲、乙、丙的能力值分别与你比较，输出"Cong"（高于）、"Ping"（持平）或"Gai"（低于）。
 * 
 * 实现原理：
 * 解题思路：
 * - 甲是两位数，从 99 到 10 从大到小枚举，找到第一个满足条件的解
 * - 乙 = 甲的数字反转（十位和个位交换）
 * - 由条件可知：|甲-乙|/X = 乙/Y = 丙，验证 |甲-乙| 能被 X 整除且乙能被 Y 整除
 * - 找到解后，用 compare/compareDouble 方法比较各人与你的能力值
 * 
 * 算法核心逻辑：
 * - 从大到小枚举（99→10），保证找到最大的甲
 * - 使用 double 精度比较，允许 1e-6 误差范围
 * - 两个独立的 compare 方法分别处理 int 和 double 类型的比较
 * 
 * 时间复杂度：O(1)，最多枚举 90 个两位数
 * 空间复杂度：O(1)，仅使用常数额外空间
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split(" ");
        int M = Integer.parseInt(parts[0]);
        int X = Integer.parseInt(parts[1]);
        int Y = Integer.parseInt(parts[2]);
        
        int jia = -1;
        int yi = -1;
        double bing = -1;
        
        // 从 99 到 10 从大到小枚举甲的能力值
        for (int i = 99; i >= 10; i--) {
            int a = i / 10;
            int b = i % 10;
            int j = b * 10 + a;  // 乙是甲的数字反转
            int diff = Math.abs(i - j);
            
            // 验证条件：|甲-乙| 能被 X 整除，乙能被 Y 整除
            if (diff % X != 0) {
                continue;
            }
            if (j % Y != 0) {
                continue;
            }
            
            // 验证丙的一致值：|甲-乙|/X 应等于 乙/Y
            double b1 = diff * 1.0 / X;
            double b2 = j * 1.0 / Y;
            
            if (Math.abs(b1 - b2) < 1e-6) {
                jia = i;
                yi = j;
                bing = b1;
                break;
            }
        }
        
        if (jia == -1) {
            System.out.println("No Solution");
        } else {
            // 输出甲、乙、丙分别与你的比较结果
            System.out.print(jia + " ");
            System.out.print(compare(jia, M) + " ");
            System.out.print(compare(yi, M) + " ");
            System.out.println(compareDouble(bing, M));
        }
    }
    
    private static String compare(int a, int b) {
        if (a > b) {
            return "Cong";
        } else if (a == b) {
            return "Ping";
        } else {
            return "Gai";
        }
    }
    
    private static String compareDouble(double a, int b) {
        if (a > b) {
            return "Cong";
        } else if (Math.abs(a - b) < 1e-6) {
            return "Ping";
        } else {
            return "Gai";
        }
    }
}
