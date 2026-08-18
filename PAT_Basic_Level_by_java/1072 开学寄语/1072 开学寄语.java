import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * 1072 开学寄语
 *
 * 题目描述：
 * 开学了，学校要对学生携带的物品进行检查，列出需要被查缴的物品清单。
 * 给定N个学生和M种需要查缴的违禁物品编号，对每个学生检查其携带的物品，
 * 输出有问题的学生姓名和其携带的违禁物品清单，最后统计有问题的人数和
 * 违禁物品的总件数。
 *
 * 实现原理：
 * 解题思路：
 * 1. 使用HashSet存储M种需要被查缴的违禁物品编号，实现O(1)的快速查找
 * 2. 遍历每个学生，检查其携带的K件物品是否在违禁集合中
 * 3. 若发现违禁物品，记录到该学生的违禁列表中
 * 4. 输出该学生姓名及违禁物品列表，更新统计计数
 * 5. 最后输出有问题的人数和违禁物品总件数
 *
 * 算法核心逻辑：
 * - HashSet提供O(1)的contains查询，高效判断物品是否违禁
 * - 使用ArrayList存储每个学生的违禁物品，支持动态添加
 * - 输出格式控制：违禁物品之间用空格分隔
 *
 * 时间复杂度：O(N×K)，遍历所有学生的所有物品
 * 空间复杂度：O(M + N×K)，存储违禁集合和查询结果
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split(" ");
        int N = Integer.parseInt(firstLine[0]);
        int M = Integer.parseInt(firstLine[1]);
        
        Set<String> forbidden = new HashSet<>();  // 存储违禁物品编号，支持O(1)查找
        String[] items = br.readLine().trim().split(" ");
        for (int i = 0; i < M; i++) {
            forbidden.add(items[i]);  // 将违禁物品加入集合
        }

        int studentCount = 0;  // 有问题的人数
        int itemCount = 0;     // 违禁物品总件数

        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split(" ");
            String name = parts[0];  // 学生姓名
            int K = Integer.parseInt(parts[1]);  // 该学生携带的物品数量
            List<String> found = new ArrayList<>();  // 记录该学生的违禁物品

            // 检查每件物品是否为违禁品
            for (int j = 0; j < K; j++) {
                String item = parts[2 + j];
                if (forbidden.contains(item)) {  // 在HashSet中查找，O(1)时间
                    found.add(item);
                }
            }

            // 如果该学生有违禁物品，输出信息
            if (!found.isEmpty()) {
                studentCount++;
                itemCount += found.size();
                System.out.print(name + ": ");
                for (int k = 0; k < found.size(); k++) {
                    if (k > 0) {
                        System.out.print(" ");
                    }
                    System.out.print(found.get(k));
                }
                System.out.println();
            }
        }
        
        System.out.println(studentCount + " " + itemCount);
    }
}
