import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1079 延迟的回文数
 * 
 * 题目描述：
 * 给定一个正整数（不超过1000位），通过将其自身与其逆转数相加的方式，在10次迭代内寻找回文数。
 * 如果在10次迭代内得到回文数，输出每次的相加过程及最终回文数；否则报告"Not found in 10 iterations."。
 * 
 * 实现原理：
 * 解题思路：
 * - 由于数字可能长达1000位，远超 long 范围，需使用字符串处理大整数
 * - 每次迭代：将当前数字与其反转相加，判断结果是否为回文数
 * - 最多迭代10次，若找到回文数则输出并结束
 * 
 * 算法核心逻辑：
 * - isPalindrome()：双指针法判断字符串是否为回文（首尾字符逐一比较）
 * - reverse()：使用 StringBuilder.reverse() 实现字符串反转
 * - add()：模拟竖式加法，从最低位逐位相加，处理进位，最后反转结果
 * 
 * 时间复杂度：O(k×n)，k 为迭代次数（≤10），n 为数字长度。每次反转和加法均为 O(n)。
 * 空间复杂度：O(n)，用于存储相加结果的 StringBuilder。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String n = br.readLine().trim();
        
        // 判断初始输入是否已经是回文数
        if (isPalindrome(n)) {
            System.out.println(n + " is a palindromic number.");
            return;
        }
        
        // 最多迭代10次，每次将当前数与其反转相加
        for (int i = 0; i < 10; i++) {
            String a = n;
            String b = reverse(a);
            String c = add(a, b);
            System.out.println(a + " + " + b + " = " + c);
            // 判断结果是否为回文数
            if (isPalindrome(c)) {
                System.out.println(c + " is a palindromic number.");
                return;
            }
            n = c;
        }
        
        // 10次迭代仍未找到回文数
        System.out.println("Not found in 10 iterations.");
    }
    
    private static boolean isPalindrome(String s) {
        int left = 0, right = s.length() - 1;
        while (left < right) {
            if (s.charAt(left) != s.charAt(right)) {
                return false;
            }
            left++;
            right--;
        }
        return true;
    }
    
    private static String reverse(String s) {
        return new StringBuilder(s).reverse().toString();
    }
    
    // 大整数加法：从最低位逐位相加，处理进位
    private static String add(String a, String b) {
        StringBuilder sb = new StringBuilder();
        int carry = 0;  // 进位标志
        int i = a.length() - 1;
        int j = b.length() - 1;
        // 从末位开始逐位相加，直到所有位处理完毕且无进位
        while (i >= 0 || j >= 0 || carry > 0) {
            int d1 = i >= 0 ? (a.charAt(i) - '0') : 0;
            int d2 = j >= 0 ? (b.charAt(j) - '0') : 0;
            int sum = d1 + d2 + carry;
            sb.append(sum % 10);  // 当前位结果
            carry = sum / 10;     // 进位到高位
            i--;
            j--;
        }
        // 结果逆序，因为是从低位开始追加的
        return sb.reverse().toString();
    }
}
