import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1086 就不告诉你
 * 
 * 题目描述：
 * 计算两个正整数 A 和 B 的乘积，将结果倒着输出。
 * 注意：如果反转后的数字有前导零，需要去掉前导零。
 * 
 * 实现原理：
 * 解题思路：
 * - 计算 A × B 得到乘积
 * - 将乘积转换为字符串后反转
 * - 去除反转后字符串的前导零（保留最后一位为0的情况）
 * 
 * 算法核心逻辑：
 * - 使用 StringBuilder.reverse() 实现字符串反转
 * - 用 while 循环删除前导零：当长度>1且首位为'0'时删除
 * - 通过保留至少1位字符，确保结果为0时正常输出"0"
 * 
 * 时间复杂度：O(log(A×B))，反转和去前导零操作与乘积的位数成正比
 * 空间复杂度：O(log(A×B))，存储乘积的字符串表示
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split(" ");
        int A = Integer.parseInt(parts[0]);
        int B = Integer.parseInt(parts[1]);
        
        int product = A * B;
        // 将乘积反转
        StringBuilder sb = new StringBuilder(String.valueOf(product));
        sb.reverse();
        
        // 去除前导零（保留至少一位，确保结果为0时输出"0"）
        while (sb.length() > 1 && sb.charAt(0) == '0') {
            sb.deleteCharAt(0);
        }
        
        System.out.println(sb.toString());
    }
}
