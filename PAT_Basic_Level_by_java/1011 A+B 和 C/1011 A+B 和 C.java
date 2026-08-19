import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1011 A+B 和 C
 *
 * 题目描述：
 * 给定 T 组整数 A、B、C，取值范围为 [-2^31, 2^31]（即 int 范围内，包含边界），
 * 依次判断每组中 A + B 是否大于 C。
 * 输出格式：每组输出一行 "Case #i: true/false"。
 *
 * 实现原理：
 * 虽然 A、B、C 本身在 int 范围内，但 A + B 可能超过 int 范围（如 2^31 - 1 + 2^31 - 1 会溢出），
 * 因此使用 long 类型（64 位）存储以避免溢出问题。
 * 逐组读取并判断 A + B > C，将结果拼接后统一输出。
 * 时间复杂度 O(T)，空间复杂度 O(1)。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int t = Integer.parseInt(br.readLine().trim());  // 测试用例组数
        StringBuilder sb = new StringBuilder();
        // 逐组判断
        for (int i = 1; i <= t; i++) {
            String[] parts = br.readLine().trim().split("\\s+");
            long a = Long.parseLong(parts[0]);           // 使用 long 防止 A+B 溢出
            long b = Long.parseLong(parts[1]);
            long c = Long.parseLong(parts[2]);
            sb.append("Case #").append(i).append(": ")
              .append(a + b > c ? "true" : "false").append('\n');
        }
        System.out.print(sb);
    }
}
