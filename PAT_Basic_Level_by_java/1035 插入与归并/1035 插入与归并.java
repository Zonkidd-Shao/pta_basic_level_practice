import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;

/**
 * 1035 插入与归并
 *
 * 题目描述：
 * 给定原始序列与某一步排序后的中间序列，判断该中间序列是由插入排序还是归并排序
 * 产生的，并输出下一步排序的序列结果。
 *
 * 实现原理：
 * 1. 先模拟插入排序：每轮将第 i 个元素插入到已排序的 [0..i-1] 区间中，每轮
 *    结束后与给定序列比较；若匹配则判定为插入排序，再执行下一轮后输出。
 * 2. 若插入排序不匹配，则判定为归并排序。模拟自底向上的归并排序（先 1 个一组、
 *    再 2 个一组、4 个一组……），每轮归并后与给定序列比较，匹配后再执行一轮
 *    归并后输出。
 * 3. mergePass 方法按指定步长 len 对数组进行一趟归并，merge 方法合并两个
 *    有序子数组。
 *
 * 时间复杂度：插入排序模拟 O(n²)，归并排序模拟 O(n log n)
 */
public class Main {
    private static int n;
    private static int[] orig, given;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        n = Integer.parseInt(br.readLine().trim());
        orig = new int[n];
        given = new int[n];
        String[] p1 = br.readLine().trim().split("\\s+");
        String[] p2 = br.readLine().trim().split("\\s+");
        for (int i = 0; i < n; i++) {
            orig[i] = Integer.parseInt(p1[i]);
            given[i] = Integer.parseInt(p2[i]);
        }

        // 模拟插入排序，每轮后与给定序列比较
        int[] a = orig.clone();
        boolean isInsertion = false;
        for (int i = 1; i < n; i++) {
            // 将 a[i] 插入到已排序区间 [0..i-1] 中
            int t = a[i];
            int j = i - 1;
            while (j >= 0 && a[j] > t) {
                a[j + 1] = a[j];
                j--;
            }
            a[j + 1] = t;
            // 若当前序列与给定序列匹配，则判定为插入排序
            if (Arrays.equals(a, given)) {
                isInsertion = true;
                // 再执行下一轮插入，得到下一步的结果
                if (i + 1 < n) {
                    int t2 = a[i + 1];
                    int j2 = i;
                    while (j2 >= 0 && a[j2] > t2) {
                        a[j2 + 1] = a[j2];
                        j2--;
                    }
                    a[j2 + 1] = t2;
                }
                break;
            }
        }

        if (isInsertion) {
            System.out.println("Insertion Sort");
            print(a);
        } else {
            // 归并排序：自底向上模拟，步长从1开始逐次翻倍
            int[] b = orig.clone();
            int step = 1;
            while (step < n) {
                // 按当前步长执行一趟归并
                mergePass(b, step);
                if (Arrays.equals(b, given)) {
                    // 匹配后，再执行一趟归并作为下一步输出
                    mergePass(b, 2 * step);
                    break;
                }
                step *= 2;
            }
            System.out.println("Merge Sort");
            print(b);
        }
    }

    // 一趟归并：按步长 len 将数组分成若干对子数组并两两合并
    private static void mergePass(int[] a, int len) {
        int i = 0;
        while (i + len < n) {
            int mid = i + len;                       // 右半部分的起始位置
            int right = Math.min(i + 2 * len, n);    // 右半部分的结束位置（不超过数组长度）
            merge(a, i, mid, right);
            i = right;                               // 移动到下一对子数组
        }
    }

    // 合并两个有序子数组 [l, m) 和 [m, r) 到原数组 a 中
    private static void merge(int[] a, int l, int m, int r) {
        int[] tmp = new int[r - l];  // 临时数组存放合并结果
        int i = l, j = m, k = 0;
        // 依次取两个子数组中较小的元素放入临时数组
        while (i < m && j < r) {
            tmp[k++] = (a[i] <= a[j]) ? a[i++] : a[j++];
        }
        // 将剩余元素复制到临时数组
        while (i < m) tmp[k++] = a[i++];
        while (j < r) tmp[k++] = a[j++];
        // 将临时数组写回原数组
        for (int x = 0; x < tmp.length; x++) a[l + x] = tmp[x];
    }

    private static void print(int[] a) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) {
            if (i > 0) sb.append(' ');
            sb.append(a[i]);
        }
        System.out.println(sb.toString());
    }
}
