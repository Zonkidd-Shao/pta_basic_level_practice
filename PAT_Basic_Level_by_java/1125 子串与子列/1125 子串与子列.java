/*
 * 1125 子串与子列
 * 
 * 题目描述：
 *     给定字符串 S 和模式 P，在 S 中找到一个最短的连续子串，
 *     使得该子串包含 P 中的所有字符（顺序与 P 中一致，即 P 是 S 的子序列），
 *     输出该子串。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 遍历 S 的每个位置作为起始点。
 *       2. 从起始位置开始，双指针匹配 P：i 指向 S，k 指向 P，
 *          当 S[i] == P[k] 时 k++，直到匹配完 P 或 S 遍历完。
 *       3. 如果匹配完 P（k == pLen），则记录当前子串长度和起始位置。
 *       4. 取所有可行子串中长度最小的输出。
 *     算法核心逻辑：
 *       - 暴力枚举起始位置，对每个起始位置用双指针匹配模式串。
 *         记录最小长度和对应的起始位置。
 *     时间复杂度：O(|S| * |P|)，最坏情况下对每个起始位置都需要遍历到末尾。
 *     空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        String s = br.readLine();
        String p = br.readLine();
        
        int sLen = s.length();
        int pLen = p.length();
        
        // 存储最短子串的起始位置和长度
        int minStart = 0;
        int minLen = Integer.MAX_VALUE;
        
        // 遍历 S 的每个可能的起始位置
        for (int i = 0; i < sLen; i++) {
            // 从位置 i 开始，匹配 P 中的字符
            int j = i; // 指向 S 的当前字符
            int k = 0; // 指向 P 的当前字符
            
            while (j < sLen && k < pLen) {
                if (s.charAt(j) == p.charAt(k)) {
                    k++; // 匹配成功，P 的指针后移
                }
                j++; // S 的指针始终后移
            }
            
            // 如果匹配完了 P 的所有字符
            if (k == pLen) {
                int len = j - i; // 当前子串长度
                if (len < minLen) {
                    minLen = len;
                    minStart = i;
                }
            }
        }
        
        // 输出最短子串
        System.out.println(s.substring(minStart, minStart + minLen));
        br.close();
    }
}
