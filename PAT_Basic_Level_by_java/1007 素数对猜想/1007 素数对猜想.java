import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1007 素数对猜想
 *
 * 题目描述：
 * 给定正整数 N（N < 10^5），计算不超过 N 的相邻且差为 2 的素数对（即孪生素数）的个数。
 * 例如 N=20 时，素数有 2、3、5、7、11、13、17、19，其中 (3,5)、(5,7)、(11,13)、(17,19)
 * 为素数对，共 4 对。
 *
 * 实现原理：
 * 遍历 2 到 N-2，依次判断 i 和 i+2 是否均为素数。判断素数使用试除法：
 * 从 2 到 sqrt(x) 尝试整除，若均不能整除则为素数。
 * 时间复杂度 O(N * sqrt(N))，空间复杂度 O(1)。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        int count = 0;
        // 遍历所有相邻差为 2 的数对 (i, i+2)
        for (int i = 2; i + 2 <= n; i++) {
            // 如果 i 和 i+2 都是素数，则找到一个素数对
            if (isPrime(i) && isPrime(i + 2)) count++;
        }
        System.out.println(count);
    }

    // 判断一个数是否为素数（试除法）
    private static boolean isPrime(int x) {
        if (x < 2) return false;
        // 只需检查到 sqrt(x)，因若 x 有因子必有一个 ≤ sqrt(x)
        for (int i = 2; i * i <= x; i++) {
            if (x % i == 0) return false;
        }
        return true;
    }
}
