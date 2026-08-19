import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1038 统计同成绩学生
 *
 * 题目描述：
 * 读入 N 个学生的成绩（取值范围 0~100）和 K 个查询分数，对每个查询输出
 * 该分数在成绩列表中的出现次数。
 *
 * 实现原理：
 * 1. 由于成绩范围固定为 0~100，可以使用计数数组（桶）来统计每个分数出现的
 *    次数，数组下标即分数值。
 * 2. 读入 N 个成绩时，对每个成绩执行 cnt[score]++ 即可完成统计。
 * 3. 查询时直接查表 cnt[query] 得到结果，用 StringBuilder 拼接输出。
 *
 * 时间复杂度：O(N + K)，N 为学生数，K 为查询数。空间复杂度 O(101)
 * 使用计数排序的思想，避免了排序或哈希表的开销。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        // 计数数组，下标 0~100 对应成绩 0~100
        int[] cnt = new int[101];
        String[] scores = br.readLine().trim().split("\\s+");
        for (int i = 0; i < n; i++) {
            cnt[Integer.parseInt(scores[i])]++;  // 对应成绩的计数加1
        }
        int k = Integer.parseInt(br.readLine().trim());
        String[] queries = br.readLine().trim().split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < k; i++) {
            if (i > 0) sb.append(' ');
            sb.append(cnt[Integer.parseInt(queries[i])]);
        }
        System.out.println(sb.toString());
    }
}
