/**
 * 1051 复数乘法
 * 
 * 题目描述：
 * 复数可以写成 (A + Bi) 的常规形式，其中 A 是实部，B 是虚部，i 是虚数单位。
 * 极坐标形式为 (R, P)，其中 R 是复数模长，P 是辐角，满足 A = R·cos(P)，B = R·sin(P)。
 * 给定两个复数的极坐标形式 (R1, P1) 和 (R2, P2)，
 * 输出它们乘积的常规形式 (A + Bi)，要求保留两位小数。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 复数乘积的模长：R = R1 × R2；辐角：P = P1 + P2。
 * 2. 根据极坐标与常规形式的转换公式计算：
 *    - 实部 A = R × cos(P)
 *    - 虚部 B = R × sin(P)
 * 3. 处理浮点数精度问题：当 |A| < 0.01 或 |B| < 0.01 时，将其视为 0，
 *    避免输出 -0.00 这样的结果。
 * 4. 按格式输出：若 B ≥ 0，输出 "A+Bi"；否则输出 "A-Bi"（此时 B 为负数）。
 * 
 * 核心思想：利用复数极坐标乘法的运算法则直接计算乘积的各项。
 * 
 * 时间复杂度：O(1)，空间复杂度：O(1)
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        double R1 = Double.parseDouble(parts[0]);
        double P1 = Double.parseDouble(parts[1]);
        double R2 = Double.parseDouble(parts[2]);
        double P2 = Double.parseDouble(parts[3]);

        // 乘积的模长和辐角
        double R = R1 * R2;
        double P = P1 + P2;

        // 计算实部和虚部
        double A = R * Math.cos(P);
        double B = R * Math.sin(P);

        // 处理浮点数精度，避免出现 -0.00
        // 只有四舍五入后仍会显示为 0.00 时才清零，避免误伤 0.009 这类结果。
        if (Math.abs(A) < 0.005) {
            A = 0;
        }
        if (Math.abs(B) < 0.005) {
            B = 0;
        }

        // 根据虚部正负决定输出格式
        if (B >= 0) {
            System.out.printf("%.2f+%.2fi\n", A, B);
        } else {
            System.out.printf("%.2f%.2fi\n", A, B);
        }
    }
}
