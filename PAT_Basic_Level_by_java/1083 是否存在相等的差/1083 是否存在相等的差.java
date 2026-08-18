import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1083 是否存在相等的差
 * 
 * 题目描述：
 * 给定 N 张牌，正面数字为 1 到 N 的排列，反面数字为输入序列。
 * 计算每张牌正面数字（i+1）与反面数字的差的绝对值，找出出现次数大于1的差值，
 * 从大到小输出差值和对应的出现次数。
 * 
 * 实现原理：
 * 解题思路：
 * - 差值的可能范围为 0 到 N-1，可使用长度为 N 的数组统计各差值出现次数
 * - 遍历所有牌，计算每张牌的 |正面-反面|，对应计数加1
 * - 从大到小遍历差值数组，输出计数大于1的差值和次数
 * 
 * 算法核心逻辑：
 * - 用 int[] count = new int[N] 统计差值出现频次
 * - 差值计算公式：diff = Math.abs((i+1) - back)
 * - 从 N-1 向下遍历到 0，确保从大到小输出
 * 
 * 时间复杂度：O(N)，只需一次遍历统计，一次遍历输出
 * 空间复杂度：O(N)，计数数组占用 N 个整型空间
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());
        String[] parts = br.readLine().trim().split(" ");
        
        int[] count = new int[N];
        
        // 统计每个差值出现的次数
        for (int i = 0; i < N; i++) {
            int back = Integer.parseInt(parts[i]);
            int diff = Math.abs((i + 1) - back);
            count[diff]++;
        }
        
        // 从大到小输出出现次数大于1的差值
        for (int i = N - 1; i >= 0; i--) {
            if (count[i] > 1) {
                System.out.println(i + " " + count[i]);
            }
        }
    }
}
