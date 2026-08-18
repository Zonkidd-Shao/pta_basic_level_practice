/*
 * 1116 多二了一点
 * 
 * 题目描述：
 *     给定一个正整数 N（可能有前导零），若 N 的位数为偶数，
 *     则将 N 从中间分成前后两半（前一半为高位部分 Y，后一半为低位部分 X），
 *     判断 X - Y 是否等于 2。
 *     若 N 的位数是奇数，则输出 "Error: len digit(s)"。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 直接判断输入字符串的长度 len 是否为偶数。
 *       2. 如果是奇数，按要求输出错误信息。
 *       3. 如果是偶数，将字符串从中点分为前半 Y 和后半 X。
 *       4. 使用 BigInteger 处理大数相减，判断 X - Y 是否等于 2。
 *     算法核心逻辑：
 *       - 字符串分割 + BigInteger 大数运算。
 *     时间复杂度：O(len)，len 为数字的位数。
 *     空间复杂度：O(len)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        String n = br.readLine();
        int len = n.length();
        
        // 判断位数是否为偶数
        if (len % 2 != 0) {
            System.out.println("Error: " + len + " digit(s)");
        } else {
            int half = len / 2;
            String yStr = n.substring(0, half); // 前半部分（高位）
            String xStr = n.substring(half);    // 后半部分（低位）
            
            BigInteger y = new BigInteger(yStr);
            BigInteger x = new BigInteger(xStr);
            
            // 判断 X - Y 是否等于 2
            if (x.subtract(y).equals(BigInteger.valueOf(2))) {
                System.out.println("Yes: " + xStr + " - " + yStr + " = 2");
            } else {
                System.out.println("No: " + xStr + " - " + yStr + " != 2");
            }
        }
        
        br.close();
    }
}
