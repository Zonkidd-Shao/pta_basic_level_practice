/*
 * 题目编号：1018 锤子剪刀布
 * 题目描述：大家应该都会玩"锤子剪刀布"的游戏。现给出两人的交锋记录，请统计双方的胜、平、负次数，
 *   并给出双方分别用什么手势的胜算最大。
 *   规则：锤子（C）赢剪刀（J），剪刀（J）赢布（B），布（B）赢锤子（C）。
 *   如果获胜次数最多的手势不唯一，则输出字母序最小的那个（B < C < J）。
 * 实现原理：
 *   解题思路：
 *   - 读取交锋次数n，逐条记录判断胜负平。
 *   - 使用两个长度为3的数组aGest和bGest分别记录甲、乙获胜时使用的手势次数，
 *     下标映射：B→0, C→1, J→2。
 *   - 胜负判断：如果x == y为平局；否则检查甲是否获胜（三种胜局：C>J, J>B, B>C），
 *     如果甲胜则aWin++并记录手势，否则乙胜（即甲负）则aLose++并记录乙的手势。
 *   - 最后找出双方获胜次数最多的手势（同次数取字母序最小）。
 * 时间复杂度：O(n)，其中n为交锋次数。
 * 空间复杂度：O(1)，仅使用常量级额外空间。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1018 锤子剪刀布
 * 统计甲乙胜负平，并给出各自获胜次数最多的手势（并列时取字母序最小 B<C<J）。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        int aWin = 0, aDraw = 0, aLose = 0;
        int[] aGest = new int[3]; // 甲获胜时使用的手势计数：0:B 1:C 2:J
        int[] bGest = new int[3]; // 乙获胜时使用的手势计数
        for (int i = 0; i < n; i++) {
            String[] p = br.readLine().trim().split("\\s+");
            char x = p[0].charAt(0), y = p[1].charAt(0);
            if (x == y) {
                aDraw++;                       // 平局
            } else if ((x == 'C' && y == 'J') || (x == 'J' && y == 'B') || (x == 'B' && y == 'C')) {
                aWin++;                        // 甲胜
                aGest[idx(x)]++;               // 记录甲获胜的手势
            } else {
                aLose++;                       // 乙胜（甲负）
                bGest[idx(y)]++;               // 记录乙获胜的手势
            }
        }
        // 输出甲的胜平负，以及乙的胜平负（乙的胜=甲的负，乙的负=甲的胜）
        System.out.println(aWin + " " + aDraw + " " + aLose);
        System.out.println(aLose + " " + aDraw + " " + aWin);
        // 输出双方获胜次数最多的手势
        System.out.println(best(aGest) + " " + best(bGest));
    }

    // 将手势字符映射到数组下标：B->0, C->1, J->2
    private static int idx(char c) {
        if (c == 'B') return 0;
        if (c == 'C') return 1;
        return 2;  // 'J'
    }

    // 找出数组中次数最多的手势，次数相同取字母序最小（B<C<J）
    private static char best(int[] g) {
        int max = -1, bi = 0;
        for (int i = 0; i < 3; i++) {
            if (g[i] > max) {
                max = g[i];
                bi = i;
            }
        }
        return bi == 0 ? 'B' : (bi == 1 ? 'C' : 'J');
    }
}