/*
 * 1100 校庆
 * 
 * 题目描述：
 *     给定N位校友的身份证号，以及M位来宾的身份证号。
 *     身份证号第7-14位为出生日期（YYYYMMDD）。
 *     统计来宾中有多少位校友，并输出其中最年长（出生日期最早）的那位校友。
 *     如果来宾中没有校友，则输出所有来宾中最年长的那位。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 使用HashSet存储所有校友的身份证号，实现O(1)的查找。
 *         2. 遍历来宾列表，对于每位来宾，检查其是否在HashSet中。
 *         3. 同时维护最年长的校友和最年长的来宾：
 *            - 出生日期字符串（YYYYMMDD格式）可直接用字符串compareTo比较，
 *              值越小表示出生越早（年龄越大）。
 *         4. 最后根据是否有校友输出对应的结果。
 *     时间复杂度：O(N + M)，空间复杂度：O(N)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.Set;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        
        // 将所有校友的身份证号存入HashSet，便于后续O(1)查找
        Set<String> alumni = new HashSet<>();
        for (int i = 0; i < n; i++) {
            alumni.add(br.readLine());
        }
        
        int m = Integer.parseInt(br.readLine());
        int count = 0;                 // 来宾中校友的人数
        String oldestAlumni = null;    // 最年长的校友身份证号
        String oldestGuest = null;     // 最年长的来宾身份证号
        String oldestAlumniBirth = null; // 最年长校友的出生日期
        String oldestGuestBirth = null;  // 最年长来宾的出生日期
        
        for (int i = 0; i < m; i++) {
            String id = br.readLine();
            // 提取身份证号第7-14位作为出生日期（YYYYMMDD格式）
            String birth = id.substring(6, 14);
            
            // 判断该来宾是否为校友
            if (alumni.contains(id)) {
                count++;
                // 字符串比较出生日期，值越小出生越早，年龄越大
                if (oldestAlumni == null || birth.compareTo(oldestAlumniBirth) < 0) {
                    oldestAlumni = id;
                    oldestAlumniBirth = birth;
                }
            }
            
            // 同时维护所有来宾中最年长的人
            if (oldestGuest == null || birth.compareTo(oldestGuestBirth) < 0) {
                oldestGuest = id;
                oldestGuestBirth = birth;
            }
        }
        
        // 输出结果
        System.out.println(count);
        if (count > 0) {
            System.out.println(oldestAlumni);
        } else {
            System.out.println(oldestGuest);
        }
    }
}
