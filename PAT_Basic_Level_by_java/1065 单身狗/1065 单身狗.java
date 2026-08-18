/**
 * 1065 单身狗
 * 
 * 题目描述：
 * "单身狗"指在派对中没有伴侣陪伴的人。给定 N 对伴侣的 ID，以及派对上所有 M 位客人的 ID，
 * 找出其中落单的客人（即没有伴侣，或者伴侣没有参加派对的人）。
 * 输出落单人数及按 ID 升序排列的列表。
 * 
 * 实现原理：
 * 解题思路：
 * 1. 用 HashMap 建立双向的伴侣映射关系，保证通过 A 能找到 B，通过 B 也能找到 A。
 * 2. 用 HashSet 存储所有参加派对的客人 ID，以便快速判断某 ID 是否在场。
 * 3. 遍历每位客人，检查其伴侣是否也在派对中：若没有伴侣（不在 map 中）或伴侣不在派对中，
 *    则判定为落单。
 * 4. 将落单的客人 ID 排序后输出。
 * 
 * 算法核心逻辑：双向映射伴侣关系 → 遍历判断是否落单 → 排序输出。
 * 
 * 时间复杂度：O(M log M)（排序耗时），空间复杂度：O(N + M)。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim()); // 伴侣对数

        // 建立双向伴侣映射
        Map<String, String> coupleMap = new HashMap<>();
        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split("\\s+");
            coupleMap.put(parts[0], parts[1]); // A -> B
            coupleMap.put(parts[1], parts[0]); // B -> A
        }

        int M = Integer.parseInt(br.readLine().trim()); // 客人总数
        String[] guests = br.readLine().trim().split("\\s+");
        // 用集合存储所有客人，便于快速查找
        Set<String> guestSet = new HashSet<>();
        for (String guest : guests) {
            guestSet.add(guest);
        }

        // 找出落单的客人
        List<String> singles = new ArrayList<>();
        for (String guest : guests) {
            String partner = coupleMap.get(guest); // 获取该客人的伴侣
            // 没有伴侣，或伴侣没有参加派对 → 落单
            if (partner == null || !guestSet.contains(partner)) {
                singles.add(guest);
            }
        }

        // 按 ID 升序排序
        Collections.sort(singles);

        // 输出结果
        System.out.println(singles.size());
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < singles.size(); i++) {
            if (i > 0) {
                sb.append(" ");
            }
            sb.append(singles.get(i));
        }
        if (singles.size() > 0) {
            System.out.println(sb.toString());
        }
    }
}