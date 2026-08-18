/*
 * 题目编号：1024 科学计数法
 * 
 * 题目描述：
 *   将科学计数法表示的实数转换为普通数字表示法（保留所有有效位数，包括末尾的 0）。
 *   科学计数法格式为：[符号][0-9].[0-9]+E[±][0-9]+，例如 "+1.23400E-03"。
 *
 * 实现原理：
 *   解题思路：将科学计数法拆分为尾数（mantissa）部分和指数（exp）部分，
 *   去掉尾数中的小数点得到纯数字串，然后根据指数的正负和大小移动小数点位置。
 *   算法核心逻辑：
 *     1. 读取输入字符串，提取符号、尾数字符串（含小数点）和指数值。
 *     2. 去掉尾数中的小数点，得到纯数字串 digits。
 *     3. 根据指数 exp 分三种情况处理：
 *        - exp >= 0：将小数点右移 exp 位。若位数不够则在末尾补零；
 *          若不需要补零则在合适位置插入小数点。
 *        - exp < 0：将小数点左移 -exp 位，即在前面补零，表示为 "0.00...0digits"。
 *   时间复杂度：O(n)，其中 n 为输入字符串长度。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String s = br.readLine().trim();

        char sign = s.charAt(0);               // 整体符号
        int ePos = s.indexOf('E');              // 字母 'E' 的位置
        String mantissa = s.substring(1, ePos); // 尾数部分（含小数点）
        int exp = Integer.parseInt(s.substring(ePos + 1)); // 指数值

        // 去掉尾数中的小数点，得到纯数字串
        String digits = mantissa.replace(".", "");

        StringBuilder res = new StringBuilder();
        if (sign == '-') res.append('-'); // 负数保留负号

        if (exp >= 0) {
            // 指数非负：小数点右移 exp 位
            if (exp + 1 >= digits.length()) {
                // 右移后长度超过数字串长度，末尾补零
                res.append(digits);
                for (int i = digits.length(); i < exp + 1; i++) res.append('0');
            } else {
                // 在数字串中插入小数点
                res.append(digits.substring(0, exp + 1));
                res.append('.');
                res.append(digits.substring(exp + 1));
            }
        } else {
            // 指数为负：小数点左移，在前面补零
            int zeros = -exp - 1; // 需要补的零的个数
            res.append("0.");
            for (int i = 0; i < zeros; i++) res.append('0');
            res.append(digits);
        }

        System.out.println(res.toString());
    }
}
