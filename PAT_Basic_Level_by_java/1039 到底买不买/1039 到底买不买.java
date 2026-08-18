import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1039 到底买不买
 *
 * 题目描述：
 * 给定店家现有的珠子串和顾客想要的珠子串，判断店家能否凑齐顾客所需的所有珠子。
 * 若能，输出"Yes"并返回多余珠子的数量；若不能，输出"No"并返回缺少珠子的数量。
 *
 * 实现原理：
 * 1. 使用 ASCII 码计数数组（大小 256）统计店家现有珠子串中每种字符的出现次数。
 * 2. 遍历想要的珠子串，对每个字符：
 *    - 若计数数组中该字符仍有剩余，则消耗一颗（计数减1）
 *    - 若计数数组中已无该字符，则 missing 计数加1
 * 3. 遍历结束后，若 missing == 0，说明可以凑齐，多余珠子数 = 店家串长度 - 想要串长度；
 *    否则输出缺少的珠子数。
 *
 * 时间复杂度：O(len(avail) + len(want))，仅需两次线性扫描
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String avail = br.readLine();
        String want = br.readLine();
        if (avail == null) avail = "";
        if (want == null) want = "";
        // 使用 ASCII 计数数组统计店家有的珠子
        int[] cnt = new int[256];
        for (int i = 0; i < avail.length(); i++) {
            cnt[avail.charAt(i)]++;
        }
        // 遍历想要的珠子，检查是否够用
        int missing = 0;
        for (int i = 0; i < want.length(); i++) {
            char c = want.charAt(i);
            if (cnt[c] > 0) cnt[c]--;   // 有该珠子，消耗一颗
            else missing++;              // 缺少该珠子
        }
        // 根据是否缺少珠子输出结果
        if (missing == 0) {
            System.out.println("Yes " + (avail.length() - want.length()));
        } else {
            System.out.println("No " + missing);
        }
    }
}
