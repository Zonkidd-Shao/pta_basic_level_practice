import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1001 害死人不偿命的(3n+1)猜想
 *
 * 题目描述：
 * 对任一不超过 1000 的正整数 n，进行如下操作：如果 n 是偶数，则砍掉一半（n = n/2）；
 * 如果 n 是奇数，则令 n = (3n+1)/2。重复上述操作直到 n = 1，统计需要多少步（砍几下）。
 *
 * 实现原理：
 * 使用 while 循环模拟卡拉兹猜想的过程。每次迭代根据 n 的奇偶性执行不同操作，
 * 并累加步数计数器 steps，当 n 变为 1 时退出循环并输出 steps。
 * 时间复杂度 O(log n)，空间复杂度 O(1)。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        int steps = 0;                          // 记录砍的步数
        // 当 n 不为 1 时，持续进行卡拉兹操作
        while (n != 1) {
            if (n % 2 == 0) {                   // n 为偶数，直接砍一半
                n /= 2;
            } else {                            // n 为奇数，(3n+1)/2
                n = (3 * n + 1) / 2;
            }
            steps++;                            // 每执行一次操作，步数加 1
        }
        System.out.println(steps);
    }
}
