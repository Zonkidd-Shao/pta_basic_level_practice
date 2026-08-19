import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1010 一元多项式求导
 *
 * 题目描述：
 * 以指数递降方式输入一元多项式非零项系数和指数（绝对值不超过 1000），
 * 输出求导后多项式非零项的系数和指数。零多项式（求导后无任何项）输出 "0 0"。
 * 输入格式：每两个整数为一组，分别是系数和指数，如 "3 4 -5 2 6 1 -2 0"
 * 表示多项式 3x^4 - 5x^2 + 6x - 2。
 *
 * 实现原理：
 * 逐对读取系数(c)和指数(e)，求导后新系数 = c * e，新指数 = e - 1。
 * 常数项（指数 0）求导后为 0，直接跳过不输出。
 * 若所有项求导后均为零（即为零多项式），输出 "0 0"。
 * 注意：题目未指定项数，需读完整行直到末尾。
 * 时间复杂度 O(K)（K 为项数），空间复杂度 O(1)。
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line = br.readLine();
        if (line == null) return;
        String[] parts = line.trim().split("\\s+");  // 数字间以空格分隔
        StringBuilder sb = new StringBuilder();
        boolean first = true;                         // 标记是否为首项（控制空格格式）
        // 每两个整数为一组（系数、指数）
        for (int i = 0; i + 1 < parts.length; i += 2) {
            int c = Integer.parseInt(parts[i]);       // 系数
            int e = Integer.parseInt(parts[i + 1]);   // 指数
            if (e == 0) continue;                     // 常数项求导为 0，跳过
            int nc = c * e;                           // 求导后的系数
            int ne = e - 1;                           // 求导后的指数
            if (!first) sb.append(' ');               // 非首项前加空格
            sb.append(nc).append(' ').append(ne);
            first = false;
        }
        // 如果没有任何项输出（零多项式），输出 "0 0"
        if (first) sb.append("0 0");
        System.out.println(sb.toString());
    }
}
