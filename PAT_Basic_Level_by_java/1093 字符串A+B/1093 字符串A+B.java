/**
 * 1093 字符串A+B
 * 
 * 题目描述：
 * 给定两个字符串 A 和 B，要求输出 A+B（即字符串拼接），
 * 但重复出现的字符只输出一次，且保持第一次出现的顺序。
 * 
 * 实现原理：
 * 解题思路：使用布尔数组记录 ASCII 字符是否已出现过，
 *   按顺序遍历 A 和 B，仅输出未出现过的字符。
 * 算法核心逻辑：
 *   1. 创建大小为 128 的布尔数组 seen，标记字符是否已出现
 *   2. 先遍历字符串 A，若字符 c 未出现过，则标记 seen[c] 并追加到结果
 *   3. 再遍历字符串 B，同样处理（已出现在 A 中的字符不再重复输出）
 *   4. 输出拼接后的结果字符串
 * 时间复杂度：O(len(A) + len(B))
 * 空间复杂度：O(1)（固定 128 大小的布尔数组）
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String a = br.readLine();
        String b = br.readLine();
        
        // 用布尔数组标记字符是否已经出现过（ASCII 范围 0~127）
        boolean[] seen = new boolean[128];
        StringBuilder sb = new StringBuilder();
        
        // 先遍历 A，输出未出现过的字符
        for (int i = 0; i < a.length(); i++) {
            char c = a.charAt(i);
            if (!seen[c]) {
                seen[c] = true;
                sb.append(c);
            }
        }
        
        // 再遍历 B，仅输出在 A 和 B 中都未出现过的字符
        for (int i = 0; i < b.length(); i++) {
            char c = b.charAt(i);
            if (!seen[c]) {
                seen[c] = true;
                sb.append(c);
            }
        }
        
        System.out.println(sb.toString());
    }
}