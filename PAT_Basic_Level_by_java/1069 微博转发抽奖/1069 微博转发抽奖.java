import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 1069 微博转发抽奖
 *
 * 题目描述：
 * 小明PAT考了满分，高兴之余决定发起微博转发抽奖活动，从转发的网友中按顺序
 * 每隔N个人就发出一个红包。编写程序帮助他确定中奖名单。
 * 要求：从第S位转发者开始，每隔N位抽取一位中奖者；如果某位中奖者已经中过奖，
 * 则顺次取下一位未中奖的用户；如果所有用户都不够抽奖，输出"Keep going..."。
 *
 * 实现原理：
 * 解题思路：
 * 1. 读取总转发人数M、间隔N和起始位置S
 * 2. 将所有转发用户存入数组
 * 3. 从第S-1位（0-indexed）开始，每次跳N位选取中奖者
 * 4. 使用HashSet记录已中奖用户，若当前用户已中奖则顺延到下一位
 * 5. 若最终中奖列表为空，输出"Keep going..."
 *
 * 算法核心逻辑：
 * - 使用HashSet存储已中奖用户，确保O(1)的查重效率
 * - 遇到重复中奖者时，通过while循环顺延到下一个未中奖用户
 * - 每次成功抽取后，索引跳N位继续抽取
 *
 * 时间复杂度：O(M)，最多遍历所有转发用户一次
 * 空间复杂度：O(M)，存储用户列表和中奖者集合
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split("\\s+");
        int M = Integer.parseInt(firstLine[0]);
        int N = Integer.parseInt(firstLine[1]);
        int S = Integer.parseInt(firstLine[2]);

        String[] users = new String[M];
        for (int i = 0; i < M; i++) {
            users[i] = br.readLine().trim();
        }

        List<String> winners = new ArrayList<>();  // 存储中奖者名单（按顺序）
        Set<String> winnerSet = new HashSet<>();  // 记录已中奖用户，用于O(1)查重

        int idx = S - 1;  // 转换为0-indexed，从第S位开始
        while (idx < M) {
            // 如果当前用户已中奖，则顺延到下一位未中奖的用户
            while (idx < M && winnerSet.contains(users[idx])) {
                idx++;
            }
            if (idx < M) {
                winners.add(users[idx]);  // 记录中奖者
                winnerSet.add(users[idx]);  // 标记已中奖
                idx += N;  // 每隔N位抽取下一位
            }
        }

        if (winners.isEmpty()) {
            System.out.println("Keep going...");
        } else {
            for (String winner : winners) {
                System.out.println(winner);
            }
        }
    }
}
