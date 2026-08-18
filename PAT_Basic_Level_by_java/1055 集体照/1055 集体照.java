/**
 * 1055 集体照
 * 
 * 题目描述：
 * 拍集体照时通常让高的站在后排、矮的站前排，且每排人数相同（最后一排可能多出几人）。
 * 每排内的排列规则如下：
 * 1. 最高的人站在该排最中间的位置（若人数为偶数，中间偏左为中间位置）。
 * 2. 其他人按身高从高到低、先左后右（中间人视角）交替插入。
 * 3. 身高相同则按名字字典序升序排列。
 * 给定 N 个人的姓名和身高，以及排数 K，输出最终的拍照队列（从后排到前排）。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 排序：按身高降序排列，身高相同按名字字典序升序。
 * 2. 计算每排人数：最后一排人数 = N - (K-1) × (N/K)，其余每排人数 = N/K。
 * 3. 从最后一排（后排）开始向前排逐排分配人员。
 * 4. 每排排列时，最高者放在中间位置 mid = m/2，
 *    然后按先左后右交替放置剩余人员。
 * 5. 从后排到前排依次输出每排的姓名。
 * 
 * 核心思想：排序 + 双指针交替插入。先整体排序再从高到低逐排处理，
 * 每排内使用双指针向左右展开的排列方式。
 * 
 * 时间复杂度：O(N log N)（排序），空间复杂度：O(N)
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
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
        String[] firstLine = br.readLine().trim().split("\\s+");
        int N = Integer.parseInt(firstLine[0]);
        int K = Integer.parseInt(firstLine[1]);

        List<Person> people = new ArrayList<>();
        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split("\\s+");
            people.add(new Person(parts[0], Integer.parseInt(parts[1])));
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
        int peoplePerRow = N / K;
        int lastRowPeople = N - (K - 1) * peoplePerRow;

        List<List<String>> rows = new ArrayList<>();
        int idx = 0;

        // 先排列最后一排（人数较多）
        int firstRowCount = lastRowPeople;
        List<String> firstRow = arrangeRow(people, idx, firstRowCount);
        rows.add(firstRow);
        idx += firstRowCount;

        // 再排列前面的 K-1 排
        for (int i = 1; i < K; i++) {
            List<String> row = arrangeRow(people, idx, peoplePerRow);
            rows.add(row);
            idx += peoplePerRow;
        }

        // 从后排到前排输出
        for (List<String> row : rows) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < row.size(); i++) {
                if (i > 0) {
                    sb.append(" ");
                }
                sb.append(row.get(i));
            }
            System.out.println(sb.toString());
        }
    }

    // 排列一排：最高的在中间，先左后右交替排列
    private static List<String> arrangeRow(List<Person> people, int start, int m) {
        String[] row = new String[m];
        int mid = m / 2;                        // 中间位置（从0开始）
        row[mid] = people.get(start).name;      // 最高者放中间

        // 使用双指针向左右展开，先左后右交替
        int left = mid - 1;
        int right = mid + 1;
        boolean toLeft = true;                  // 先放左边

        for (int i = 1; i < m; i++) {
            if (toLeft) {
                row[left] = people.get(start + i).name;
                left--;
            } else {
                row[right] = people.get(start + i).name;
                right++;
            }
            toLeft = !toLeft;
        }

        List<String> result = new ArrayList<>();
        for (String s : row) {
            result.add(s);
        }
        return result;
    }
}
