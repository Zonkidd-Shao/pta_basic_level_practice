import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1084 外观数列
 * 
 * 题目描述：
 * 外观数列（Look-and-say sequence）的第1项为数字 d，
 * 第2项是对第1项的描述："d出现了1次" → "d1"，
 * 第3项是对第2项的描述："d出现了1次，1出现了1次" → "d111"，
 * 以此类推。给定 d 和 N，输出外观数列的第 N 项。
 * 
 * 实现原理：
 * 解题思路：
 * - 外观数列的每一项都是对前一项中连续字符的描述
 * - 从第1项开始，迭代 N-1 次生成第 N 项
 * - 每次迭代：遍历当前字符串，统计连续相同字符的个数，输出"字符+个数"
 * 
 * 算法核心逻辑：
 * - getNext() 方法：双指针遍历，外层指针 i 指向当前字符
 * - 内层循环统计连续相同字符的个数 count
 * - 将字符和个数追加到 StringBuilder 中
 * - 注意：外观数列与1078压缩操作相似，但所有字符后都跟数字（包括单个字符）
 * 
 * 时间复杂度：O(k×m)，k为迭代次数（N-1），m为当前字符串长度
 * 空间复杂度：O(m)，存储当前项和下一项字符串
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split(" ");
        String d = parts[0];
        int N = Integer.parseInt(parts[1]);
        
        // 迭代生成第 N 项，迭代 N-1 次
        String current = d;
        for (int i = 1; i < N; i++) {
            current = getNext(current);
        }
        
        System.out.println(current);
    }
    
    // 根据前一项生成下一项：统计连续相同字符，输出"字符+个数"
    private static String getNext(String s) {
        StringBuilder sb = new StringBuilder();
        int n = s.length();
        int i = 0;
        while (i < n) {
            char c = s.charAt(i);
            int count = 1;
            // 统计连续相同字符的个数
            while (i + count < n && s.charAt(i + count) == c) {
                count++;
            }
            sb.append(c);
            sb.append(count);
            i += count;
        }
        return sb.toString();
    }
}
