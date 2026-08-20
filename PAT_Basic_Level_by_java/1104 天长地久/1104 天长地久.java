import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Main {
    static class Result {
        int n;
        long a;
        Result(int n, long a) { this.n = n; this.a = a; }
    }

    static int k;
    static int target;
    static List<Result> results;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int cases = Integer.parseInt(br.readLine().trim());
        for (int caseNo = 1; caseNo <= cases; caseNo++) {
            String[] parts = br.readLine().trim().split("\\s+");
            k = Integer.parseInt(parts[0]);
            target = Integer.parseInt(parts[1]);
            results = new ArrayList<>();

            // 若 A 的末位不是 9，则 digitSum(A+1)=m+1，gcd(m,m+1)=1。
            // 所以只需枚举末尾连续 9 的数量，并生成其前缀。
            for (int trailingNines = 1; trailingNines < k; trailingNines++) {
                int prefixSum = target - 9 * trailingNines;
                int prefixLength = k - trailingNines;
                if (prefixSum <= 0 || prefixSum > 9 * prefixLength) continue;
                int nextSum = prefixSum + 1;
                int gcd = gcd(target, nextSum);
                if (!isPrime(gcd) || gcd <= 2) continue;
                buildPrefix(0, prefixLength, prefixSum, 0, trailingNines);
            }

            results.sort(Comparator.comparingInt((Result r) -> r.n)
                    .thenComparingLong(r -> r.a));
            System.out.println("Case " + caseNo);
            if (results.isEmpty()) {
                System.out.println("No Solution");
            } else {
                for (Result result : results) {
                    System.out.println(result.n + " " + result.a);
                }
            }
        }
    }

    static void buildPrefix(int pos, int length, int remaining, long prefix, int trailingNines) {
        if (pos == length) {
            if (remaining == 0) {
                long a = prefix;
                for (int i = 0; i < trailingNines; i++) a = a * 10 + 9;
                results.add(new Result(target + 1 - 9 * trailingNines, a));
            }
            return;
        }

        int minDigit = pos == 0 ? 1 : 0;
        int maxDigit = Math.min(9, remaining);
        // 前缀的最后一位不能为 9，否则实际末尾 9 的数量会更多。
        if (pos == length - 1) maxDigit = Math.min(maxDigit, 8);
        for (int digit = minDigit; digit <= maxDigit; digit++) {
            int left = length - pos - 1;
            if (remaining - digit < 0 || remaining - digit > 9 * left) continue;
            buildPrefix(pos + 1, length, remaining - digit,
                    prefix * 10 + digit, trailingNines);
        }
    }

    static int gcd(int a, int b) {
        while (b != 0) {
            int t = a % b;
            a = b;
            b = t;
        }
        return a;
    }

    static boolean isPrime(int n) {
        if (n < 2) return false;
        for (int i = 2; i * i <= n; i++) {
            if (n % i == 0) return false;
        }
        return true;
    }
}
