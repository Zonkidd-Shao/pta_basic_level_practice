/*
 * 1113 钱串子的加法
 * 
 * 题目描述：
 *     给定两个 30 进制数（由数字 0-9 和小写字母 a-t 组成，
 *     其中 a=10, b=11, ..., t=29），计算它们的和，并以 30 进制输出结果。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 将 30 进制数视为字符串，从低位（最右端）开始逐位相加。
 *       2. 定义字符与数值的互转函数：
 *          - charToInt: '0'-'9' → 0-9, 'a'-'t' → 10-29
 *          - intToChar: 0-9 → '0'-'9', 10-29 → 'a'-'t'
 *       3. 从右向左逐位相加，维护进位 carry，模拟竖式加法。
 *       4. 最终结果反转后去掉前导零。
 *     算法核心逻辑：
 *       - 大数加法思想，利用 StringBuilder 从低位到高位拼接，
 *         最后反转得到正确顺序。
 *     时间复杂度：O(max(len1, len2))，其中 len1、len2 为两个数的位数。
 *     空间复杂度：O(max(len1, len2))，用于存储结果字符串。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    // 30 进制基数
    private static final int BASE = 30;
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        // 读取输入的两个 30 进制数
        String[] nums = br.readLine().split(" ");
        String num1 = nums[0];
        String num2 = nums[1];
        
        // 执行 30 进制加法
        String result = addBase30(num1, num2);
        
        System.out.println(result);
        br.close();
    }
    
    /**
     * 30 进制加法（从低位到高位逐位相加，模拟竖式）
     * @param num1 第一个 30 进制数字符串
     * @param num2 第二个 30 进制数字符串
     * @return 和为 30 进制字符串
     */
    private static String addBase30(String num1, String num2) {
        StringBuilder sb = new StringBuilder();
        
        int i = num1.length() - 1; // 指向 num1 的最低位
        int j = num2.length() - 1; // 指向 num2 的最低位
        int carry = 0; // 进位
        
        // 从低位到高位逐位相加，直到所有位都处理完且无进位
        while (i >= 0 || j >= 0 || carry > 0) {
            int digit1 = (i >= 0) ? charToInt(num1.charAt(i)) : 0;
            int digit2 = (j >= 0) ? charToInt(num2.charAt(j)) : 0;
            
            int sum = digit1 + digit2 + carry;
            carry = sum / BASE;   // 进位
            int current = sum % BASE; // 当前位结果
            
            sb.append(intToChar(current));
            
            i--;
            j--;
        }
        
        // 反转得到正确顺序（高位在前）
        sb.reverse();
        
        // 处理前导零（保留最后一位，即使结果是 0）
        int start = 0;
        while (start < sb.length() - 1 && sb.charAt(start) == '0') {
            start++;
        }
        
        return sb.substring(start);
    }
    
    /**
     * 30 进制字符转换为数值
     * '0'-'9' → 0-9, 'a'-'t' → 10-29
     */
    private static int charToInt(char c) {
        if (c >= '0' && c <= '9') {
            return c - '0';
        } else {
            return c - 'a' + 10;
        }
    }
    
    /**
     * 数值转换为 30 进制字符
     * 0-9 → '0'-'9', 10-29 → 'a'-'t'
     */
    private static char intToChar(int num) {
        if (num < 10) {
            return (char) ('0' + num);
        } else {
            return (char) ('a' + num - 10);
        }
    }
}
