/*
 * 1101 B是A的多少倍
 * 
 * 题目描述：
 *     给定一个正整数A和一个数字D，将A的最低D位数字截下移到最高位前面，
 *     组成一个新的数字B。计算B是A的多少倍，结果保留两位小数。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 将A作为字符串处理，使用字符串截取操作分离高位移和低位部分。
 *         2. 低位部分 = A的最后D位，高位部分 = A的剩余高位。
 *         3. 新数B = 低位部分拼接高位部分。
 *         4. 将A和B转换为数值类型，计算B/A，保留两位小数输出。
 *     时间复杂度：O(len(A))，空间复杂度：O(len(A))。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().split(" ");
        String aStr = parts[0];
        int d = Integer.parseInt(parts[1]);
        
        long a = Long.parseLong(aStr);
        int len = aStr.length();
        
        // 截取最低D位作为低位部分
        String lowStr = aStr.substring(len - d);
        // 截取剩余高位部分
        String highStr = aStr.substring(0, len - d);
        
        // 组成新数B：把最低D位移到最高位前面，即 lowStr + highStr
        String bStr = lowStr + highStr;
        long b = Long.parseLong(bStr);
        
        // 计算B是A的多少倍，保留两位小数
        double result = (double) b / a;
        System.out.printf("%.2f\n", result);
    }
}
