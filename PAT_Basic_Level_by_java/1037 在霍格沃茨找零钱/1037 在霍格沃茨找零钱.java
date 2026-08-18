import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1037 在霍格沃茨找零钱
 *
 * 题目描述：
 * 计算两个霍格沃茨货币值之差，货币单位为 Galleon.Sickle.Knut（加隆·西可·纳特），
 * 进制关系为：17 Sickle = 1 Galleon，29 Knut = 1 Sickle。
 *
 * 实现原理：
 * 1. 先将两个货币值统一转换为最小单位 Knut（纳特）：
 *    totalKnuts = G * 17 * 29 + S * 29 + K
 * 2. 计算差值（被减数 - 减数），若结果为负则记录符号位。
 * 3. 将差值的绝对值从 Knut 反向转换回 Galleon.Sickle.Knut 格式：
 *    - G = diff / (17 * 29)
 *    - S = (diff % (17 * 29)) / 29
 *    - K = diff % 29
 * 4. 若差值为负，在输出前加负号。
 *
 * 时间复杂度：O(1)，仅进行常数次算术运算
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String p = br.readLine().trim();
        String p2 = br.readLine().trim();
        long v1 = toKnuts(p);
        long v2 = toKnuts(p2);
        long diff = v1 - v2;
        boolean neg = diff < 0;
        if (neg) diff = -diff;
        long g = diff / (17 * 29);
        diff %= (17 * 29);
        long s = diff / 29;
        long k = diff % 29;
        if (neg) System.out.print("-");
        System.out.println(g + "." + s + "." + k);
    }

    // 将 Galleon.Sickle.Knut 格式的字符串统一转换为最小单位 Knut
    private static long toKnuts(String str) {
        String[] parts = str.split("\\.");
        long g = Long.parseLong(parts[0]);
        long s = Long.parseLong(parts[1]);
        long k = Long.parseLong(parts[2]);
        return g * 17 * 29 + s * 29 + k;
    }
}
