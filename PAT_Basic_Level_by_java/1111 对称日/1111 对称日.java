/*
 * 1111 对称日
 * 
 * 题目描述：
 *     给定多个日期（格式为 "Month Day, Year"，如 "Jan 1, 2020"），
 *     将日期转换为 8 位数字字符串（年年年年月月日日），
 *     判断该字符串是否为回文（对称），输出 "Y" 或 "N" 及转换后的字符串。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 使用 HashMap 建立月份英文缩写到数字（1~12）的映射。
 *       2. 读入每个日期，解析出月份、日、年。
 *       3. 用 String.format 格式化为 "yyyyMMdd" 的 8 位字符串。
 *       4. 双指针法判断该字符串是否为回文。
 *     算法核心逻辑：
 *       - 回文判断：左指针从开头、右指针从末尾向中间移动，
 *         若字符始终相同则为回文。
 *     时间复杂度：O(n * L)，其中 n 为日期个数，L = 8 为固定长度。
 *     空间复杂度：O(1)，仅使用常数级额外空间。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public class Main {
    // 月份英文缩写到数字（1~12）的映射表
    private static final Map<String, Integer> monthMap = new HashMap<>();
    
    // 静态初始化块，填充月份映射
    static {
        monthMap.put("Jan", 1);
        monthMap.put("Feb", 2);
        monthMap.put("Mar", 3);
        monthMap.put("Apr", 4);
        monthMap.put("May", 5);
        monthMap.put("Jun", 6);
        monthMap.put("Jul", 7);
        monthMap.put("Aug", 8);
        monthMap.put("Sep", 9);
        monthMap.put("Oct", 10);
        monthMap.put("Nov", 11);
        monthMap.put("Dec", 12);
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        
        for (int i = 0; i < n; i++) {
            String line = br.readLine();
            // 按空格拆分日期，格式为 ["Month", "Day,", "Year"]
            String[] parts = line.split(" ");
            String monthStr = parts[0];
            // 去掉日数字后面的逗号，如 "1," -> "1"
            int day = Integer.parseInt(parts[1].replace(",", ""));
            int year = Integer.parseInt(parts[2]);
            
            int month = monthMap.get(monthStr);
            
            // 将日期格式化为 8 位数字字符串：年年年年月月日日
            String dateStr = String.format("%04d%02d%02d", year, month, day);
            
            // 判断格式化后的字符串是否为回文（对称）
            boolean isSymmetric = isPalindrome(dateStr);
            
            System.out.println((isSymmetric ? "Y" : "N") + " " + dateStr);
        }
        
        br.close();
    }
    
    /**
     * 双指针法判断字符串是否为回文
     * @param s 待判断的字符串
     * @return true 表示是回文，false 表示不是
     */
    private static boolean isPalindrome(String s) {
        int left = 0;
        int right = s.length() - 1;
        while (left < right) {
            if (s.charAt(left) != s.charAt(right)) {
                return false; // 左右字符不等，不是回文
            }
            left++;
            right--;
        }
        return true;
    }
}
