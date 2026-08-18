/*
 * 题目编号：1017 A除以B
 * 题目描述：本题要求计算A/B，其中A是不超过1000位的正整数，B是1位正整数。
 *   你需要输出商Q和余数R，使得A = B × Q + R 成立。
 * 实现原理：
 *   解题思路：由于A可能长达1000位，远超基本整数类型的表示范围，因此采用手工竖式除法模拟。
 *   从A的最高位开始，逐位处理：
 *   - 每次取当前位数字，与上一步的余数组合成新的被除数（r = r * 10 + digit）
 *   - 计算当前位的商（qd = r / b）
 *   - 更新余数（r = r % b）
 *   注意：商的最高位不能为0（除非商本身就是0），因此只有在已有输出或有非零商时才附加到结果中。
 *   如果最终商为空（即A < B的情况），则输出0。
 * 时间复杂度：O(len(A))，其中len(A)为A的位数。
 * 空间复杂度：O(len(A))，用于存储商的字符串。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1017 A除以B
 * A 为不超过 1000 位的正整数，B 为 1 位正整数，模拟竖式除法输出商与余数。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        String a = parts[0];
        int b = Integer.parseInt(parts[1]);
        StringBuilder q = new StringBuilder();  // 存储商的每一位
        int r = 0;                               // 当前余数
        // 模拟竖式除法：从最高位到最低位逐位计算
        for (int i = 0; i < a.length(); i++) {
            int digit = a.charAt(i) - '0';   // 当前位数字
            r = r * 10 + digit;               // 上一步余数加上当前位，构成新的被除数
            int qd = r / b;                    // 当前位的商
            if (q.length() > 0 || qd > 0) q.append(qd);  // 跳过前导0
            r = r % b;                         // 更新余数
        }
        if (q.length() == 0) q.append('0');    // 如果商为空（即A < B），输出0
        System.out.println(q.toString() + " " + r);
    }
}