import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

/**
 * 1005 继续(3n+1)猜想
 *
 * 题目描述：
 * 卡拉兹猜想中，对每个数进行推导的过程中会覆盖到若干数。给定一系列正整数（不超过 100），
 * 找出其中不能被其他数"覆盖"的"关键数"（即该数不会在其他数的推导过程中出现），
 * 按从大到小的顺序输出。
 *
 * 实现原理：
 * 1. 用布尔数组 covered[] 标记每个数在推导过程中是否被覆盖到（初始化大小为 10000，因为
 *    推导过程中可能出现较大的中间值，但题目所给数字不超过 100，覆盖范围有限）。
 * 2. 对每个输入数进行卡拉兹推导（直到 1），将过程中出现的每个数在 covered 中标记为 true。
 * 3. 遍历输入数组，找出未被覆盖的数加入结果列表，然后降序排序输出。
 * 时间复杂度 O(k * log n)，空间复杂度 O(N)（N 为标记数组大小）。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int k = Integer.parseInt(br.readLine().trim());      // 待验证数字的个数
        String[] parts = br.readLine().trim().split("\\s+");
        int[] a = new int[k];                                // 存储输入的数字
        boolean[] covered = new boolean[10000];              // 标记推导过程中被覆盖的数
        // 对每个输入数进行卡拉兹推导
        for (int i = 0; i < k; i++) {
            a[i] = Integer.parseInt(parts[i]);
            int n = a[i];
            // 模拟卡拉兹过程，标记所有经过的数
            while (n != 1) {
                if (n % 2 == 0) n /= 2;
                else n = (3 * n + 1) / 2;
                covered[n] = true;                           // n 被覆盖
            }
        }
        // 找出未被覆盖的关键数
        ArrayList<Integer> res = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            if (!covered[a[i]]) res.add(a[i]);
        }
        // 降序排列
        Collections.sort(res, Collections.reverseOrder());
        // 按格式输出
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < res.size(); i++) {
            if (i > 0) sb.append(' ');
            sb.append(res.get(i));
        }
        System.out.println(sb.toString());
    }
}
