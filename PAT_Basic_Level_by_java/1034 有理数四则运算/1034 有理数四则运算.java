import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.math.BigInteger;

/**
 * 1034 有理数四则运算
 *
 * 题目描述：
 * 对两个有理数进行加、减、乘、除四则运算，结果要求化简为最简分数形式，
 * 按 a/b 或整数形式输出；若除数为零则输出 Inf。
 *
 * 实现原理：
 * 1. 使用 BigInteger 处理大整数运算，避免溢出。
 * 2. 定义 Rat 内部类表示有理数，在构造器中自动完成约分（分子分母同时除以 gcd
 *    最大公约数），并确保分母始终为正数。
 * 3. 四则运算分别按公式计算：
 *    - 加法：a/b + c/d = (ad+bc)/bd
 *    - 减法：a/b - c/d = (ad-bc)/bd
 *    - 乘法：a/b * c/d = ac/bd
 *    - 除法：a/b ÷ c/d = ad/bc（需检查除数是否为 0）
 * 4. Rat 的 show() 方法将结果输出为整数或分数形式。
 *
 * 时间复杂度：每次运算 O(log min(a,b))，主要来自 BigInteger.gcd()
 */
public class Main {
    static class Rat {
        BigInteger n, d;
        Rat(BigInteger n, BigInteger d) {
            if (d.signum() < 0) {
                n = n.negate();
                d = d.negate();
            }
            BigInteger g = n.gcd(d);
            if (g.signum() != 0) {
                n = n.divide(g);
                d = d.divide(g);
            }
            this.n = n;
            this.d = d;
        }
        String show() {
            if (n.signum() == 0) return "0";
            boolean negative = n.signum() < 0;
            BigInteger abs = n.abs();
            BigInteger whole = abs.divide(d);
            BigInteger rem = abs.remainder(d);
            String body;
            if (rem.signum() == 0) {
                body = whole.toString();
            } else if (whole.signum() == 0) {
                body = rem + "/" + d;
            } else {
                body = whole + " " + rem + "/" + d;
            }
            return negative ? "(-" + body + ")" : body;
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] parts = br.readLine().trim().split("\\s+");
        String[] f1 = parts[0].split("/");
        String[] f2 = parts[1].split("/");
        Rat r1 = new Rat(new BigInteger(f1[0]), new BigInteger(f1[1]));
        Rat r2 = new Rat(new BigInteger(f2[0]), new BigInteger(f2[1]));

        // 加法：a/b + c/d = (ad+bc)/bd
        Rat add = new Rat(r1.n.multiply(r2.d).add(r2.n.multiply(r1.d)), r1.d.multiply(r2.d));
        // 减法：a/b - c/d = (ad-bc)/bd
        Rat sub = new Rat(r1.n.multiply(r2.d).subtract(r2.n.multiply(r1.d)), r1.d.multiply(r2.d));
        // 乘法：a/b * c/d = ac/bd
        Rat mul = new Rat(r1.n.multiply(r2.n), r1.d.multiply(r2.d));
        // 除法：a/b ÷ c/d = ad/bc，若除数(r2)分子为0则结果为Inf
        Rat div = r2.n.signum() == 0 ? null
                : new Rat(r1.n.multiply(r2.d), r1.d.multiply(r2.n));

        System.out.println(r1.show() + " + " + r2.show() + " = " + add.show());
        System.out.println(r1.show() + " - " + r2.show() + " = " + sub.show());
        System.out.println(r1.show() + " * " + r2.show() + " = " + mul.show());
        System.out.print(r1.show() + " / " + r2.show() + " = ");
        System.out.println(div == null ? "Inf" : div.show());
    }
}
