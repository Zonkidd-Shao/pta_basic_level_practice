/*
 * 1123 舍入
 * 
 * 题目描述：
 *     给定一个正实数（可能为整数），以及保留小数位数 d 和舍入模式 op：
 *       op=1：四舍五入（第 d+1 位 ≥ 5 则进位）
 *       op=2：直接截断（直接舍去第 d+1 位及后面的数字）
 *       op=3：四舍六入五成双（第 d+1 位 > 5 进位，< 5 舍去，
 *             等于 5 时看 5 后面是否有非零数字，有则进位，
 *             没有则看第 d 位奇偶性，奇数进位、偶数舍去）
 *     对每个数进行舍入并输出结果。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 分离整数部分和小数部分。
 *       2. 如果小数部分长度 < d，直接补零后返回。
 *       3. 根据 op 模式判断是否需要进位：
 *          - op=1（四舍五入）：看第 d+1 位 ≥ 5 则进位。
 *          - op=2（截断）：直接截取前 d 位小数。
 *          - op=3（四舍六入五成双）：根据规则判断。
 *       4. 如果需要进位，从小数部分第 d-1 位开始加 1，处理连续进位。
 *       5. 如果进位传递到整数部分，调用 addOne 处理整数进位。
 *     算法核心逻辑：
 *       - 模拟进位运算：从低位到高位遍历小数部分，逢 10 进位。
 *         整数部分进位也采用类似的逐位加 1 逻辑。
 *     时间复杂度：O(n * L)，L 为数字位数。
 *     空间复杂度：O(L)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        String[] firstLine = br.readLine().split(" ");
        int n = Integer.parseInt(firstLine[0]);
        int d = Integer.parseInt(firstLine[1]);
        
        for (int i = 0; i < n; i++) {
            String[] parts = br.readLine().split(" ");
            int op = Integer.parseInt(parts[0]);
            String num = parts[1];
            
            String result = round(num, d, op);
            System.out.println(result);
        }
        
        br.close();
    }
    
    /**
     * 舍入函数
     * @param num 待舍入的数字字符串
     * @param d   保留的小数位数
     * @param op  舍入模式：1=四舍五入，2=截断，3=四舍六入五成双
     * @return 舍入后的结果字符串
     */
    private static String round(String num, int d, int op) {
        // 分离整数部分和小数部分
        String intPart, decPart;
        if (num.contains(".")) {
            String[] parts = num.split("\\.");
            intPart = parts[0];
            decPart = parts[1];
        } else {
            intPart = num;
            decPart = "";
        }
        
        // 如果小数部分长度小于 d，直接在末尾补零后返回
        if (decPart.length() < d) {
            StringBuilder sb = new StringBuilder(decPart);
            while (sb.length() < d) {
                sb.append('0');
            }
            return intPart + "." + sb.toString();
        }
        
        // op=2：截断模式，直接截取前 d 位小数
        if (op == 2) {
            return intPart + "." + decPart.substring(0, d);
        }
        
        // 判断是否需要进位
        boolean needCarry = false;
        
        if (op == 1) {
            // 四舍五入：看第 d+1 位，>=5 则进位
            if (d < decPart.length()) {
                int nextDigit = decPart.charAt(d) - '0';
                needCarry = (nextDigit >= 5);
            }
        } else if (op == 3) {
            // 四舍六入五成双
            if (d < decPart.length()) {
                int nextDigit = decPart.charAt(d) - '0';
                if (nextDigit > 5) {
                    needCarry = true;
                } else if (nextDigit < 5) {
                    needCarry = false;
                } else {
                    // 等于 5 的情况
                    // 检查 5 后面是否还有非零数字
                    boolean hasNonZeroAfter = false;
                    for (int i = d + 1; i < decPart.length(); i++) {
                        if (decPart.charAt(i) != '0') {
                            hasNonZeroAfter = true;
                            break;
                        }
                    }
                    if (hasNonZeroAfter) {
                        needCarry = true; // 5 后面有非零数字，进位
                    } else {
                        // 5 后面全是 0，看保留位的最后一位的奇偶性
                        // 奇数进位，偶数舍去
                        int lastDigit;
                        if (d == 0) {
                            // 保留 0 位小数，看整数部分最后一位
                            lastDigit = intPart.charAt(intPart.length() - 1) - '0';
                        } else {
                            lastDigit = decPart.charAt(d - 1) - '0';
                        }
                        needCarry = (lastDigit % 2 == 1); // 奇数进位
                    }
                }
            }
        }
        
        // 构造结果
        String resultDec = decPart.substring(0, d);
        String resultInt = intPart;
        
        if (needCarry) {
            // 需要进位，从小数部分第 d-1 位开始加 1
            if (d == 0) {
                // 保留 0 位小数，直接给整数部分加 1
                resultInt = addOne(resultInt);
            } else {
                // 小数部分加 1，可能会有连续进位
                char[] decChars = resultDec.toCharArray();
                int carry = 1;
                for (int i = decChars.length - 1; i >= 0 && carry > 0; i--) {
                    int digit = decChars[i] - '0' + carry;
                    if (digit == 10) {
                        decChars[i] = '0';
                        carry = 1;
                    } else {
                        decChars[i] = (char) ('0' + digit);
                        carry = 0;
                    }
                }
                resultDec = new String(decChars);
                // 如果进位传递到整数部分
                if (carry > 0) {
                    resultInt = addOne(resultInt);
                }
            }
        }
        
        if (d == 0) {
            return resultInt;
        } else {
            return resultInt + "." + resultDec;
        }
    }
    
    /**
     * 给一个字符串表示的非负整数加 1
     * @param num 非负整数字符串
     * @return 加 1 后的字符串
     */
    private static String addOne(String num) {
        char[] chars = num.toCharArray();
        int carry = 1;
        for (int i = chars.length - 1; i >= 0 && carry > 0; i--) {
            int digit = chars[i] - '0' + carry;
            if (digit == 10) {
                chars[i] = '0';
                carry = 1;
            } else {
                chars[i] = (char) ('0' + digit);
                carry = 0;
            }
        }
        if (carry > 0) {
            return "1" + new String(chars); // 最高位进位，如 999 -> 1000
        } else {
            return new String(chars);
        }
    }
}
