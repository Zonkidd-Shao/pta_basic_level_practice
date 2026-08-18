/**
 * 1055 集体照
 * 
 * 题目描述：
 * 拍集体照时通常让高的站在后排、矮的站前排，且每排人数相同（最后一排可能多几人）。
 * 每排排列规则：
 * 1. 最高的人站在中间（即该排最中间的位置，若人数为偶数，中间偏左为中间位置）。
 * 2. 其他人按身高从高到低、先右后左（中间人视角）交替插入。
 * 3. 身高相同则按名字字典序升序排列。
 * 给定 N 个人的姓名和身高，以及排数 K，输出拍照后的队列（从后排到前排）。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 排序：按身高降序排列，身高相同按名字字典序升序。
 * 2. 计算每排人数：最后一排人数 = N - (K-1) × (N/K)，其余每排人数 = N/K。
 * 3. 从最后一排（后排）开始向前排逐排分配人员。
 * 4. 每排排列时，最高者放在中间位置 mid = m/2，
 *    然后按先左后右（或先右后左）交替放置剩余人员。
 * 5. 从后排到前排依次输出每排的姓名。
 * 
 * 核心思想：排序 + 双指针交替插入。先整体排序再从高到低逐排处理，
 * 每排内使用双指针向左右展开的排列方式。
 * 
 * 时间复杂度：O(N log N)（排序），空间复杂度：O(N)
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Main {
    static class Person {
        String name;
        int height;
        
        Person(String name, int height) {
            this.name = name;
            this.height = height;
        }
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        String[] firstLine = br.readLine().split(" ");
        int N = Integer.parseInt(firstLine[0]);
        int K = Integer.parseInt(firstLine[1]);
        
        List<Person> people = new ArrayList<>();
        
        for (int i = 0; i < N; i++) {
            String[] line = br.readLine().split(" ");
            people.add(new Person(line[0], Integer.parseInt(line[1])));
        }
        
        // 按身高降序排序，身高相同按名字字典序升序
        Collections.sort(people, new Comparator<Person>() {
            @Override
            public int compare(Person p1, Person p2) {
                if (p1.height != p2.height) {
                    return p2.height - p1.height;
                } else {
                    return p1.name.compareTo(p2.name);
                }
            }
        });
        
        // 计算每排人数
        int rowCount = N / K;                     // 每排基础人数（向下取整）
        int lastRowCount = N - rowCount * (K - 1); // 最后一排多出的人数
        
        // 分配人员到各排（从后往前排，因为高的在后排）
        List<List<Person>> rows = new ArrayList<>();
        int idx = 0;
        
        // 先排最后一排（人数最多）
        List<Person> lastRow = new ArrayList<>();
        for (int i = 0; i < lastRowCount; i++) {
            lastRow.add(people.get(idx++));
        }
        rows.add(lastRow);
        
        // 再排前面的 K-1 排
        for (int i = 0; i < K - 1; i++) {
            List<Person> row = new ArrayList<>();
            for (int j = 0; j < rowCount; j++) {
                row.add(people.get(idx++));
            }
            rows.add(row);
        }
        
        // 对每排进行排列（最高的在中间，先右后左交替排列）
        for (List<Person> row : rows) {
            arrangeRow(row);
        }
        
        // 输出（从后排到前排，rows[0]是最后一排，输出在最上面）
        for (List<Person> row : rows) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < row.size(); i++) {
                if (i > 0) {
                    sb.append(" ");
                }
                sb.append(row.get(i).name);
            }
            System.out.println(sb.toString());
        }
    }
    
    // 排列每一排：最高的在中间，先右后左交替排列
    private static void arrangeRow(List<Person> row) {
        int m = row.size();
        Person[] arranged = new Person[m];
        int mid = m / 2; // 中间位置（从0开始）
        
        // 第一个人（最高）放在中间
        arranged[mid] = row.get(0);
        
        // 先右后左交替放置
        int left = mid - 1;
        int right = mid + 1;
        boolean putRight = true; // 下一个放在右边
        
        for (int i = 1; i < m; i++) {
            if (putRight) {
                arranged[right] = row.get(i);
                right++;
            } else {
                arranged[left] = row.get(i);
                left--;
            }
            putRight = !putRight;
        }
        
        // 把排列好的结果放回 row
        row.clear();
        for (Person p : arranged) {
            row.add(p);
        }
    }
}
