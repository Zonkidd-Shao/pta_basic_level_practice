import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1074 宇宙无敌加法器
 *
 * 题目描述：
 * 地球人习惯使用十进制，而PAT星人的进制很特殊——每一位的进制都不同。
 * 给定一个进制表（每位数字表示该位的进制，0表示十进制），以及两个PAT数，
 * 计算它们的和并输出。两个PAT数的长度可能不同，且可能包含前导零。
 *
 * 实现原理：
 * 解题思路：
 * 1. 从最低位（个位）开始，逐位进行加法运算
 * 2. 每位从进制表中获取对应的进制值，若进制表长度不足则默认为十进制
 * 3. 两个数对应位相加，加上进位后对当前位进制取模得到该位结果
 * 4. 计算进位值（和除以进制），传递到下一位
 * 5. 处理完所有位后，若还有进位则继续添加
 * 6. 去除结果中的前导零后反向输出
 *
 * 算法核心逻辑：
 * - 从三个字符串的末尾开始逐位处理（低位对齐）
 * - 进制表中'0'表示十进制，需特殊处理为10
 * - 使用StringBuilder从低位到高位追加结果，最后reverse()得到正确顺序
 * - 去除前导零时保留最后一位（即结果为0时输出0）
 *
 * 时间复杂度：O(max(L1, L2, Lbase))，其中L1、L2为两个数的长度，Lbase为进制表长度
 * 空间复杂度：O(max(L1, L2))，存储结果字符串
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String base = br.readLine().trim();
        String num1 = br.readLine().trim();
        String num2 = br.readLine().trim();
        
        int len1 = num1.length();
        int len2 = num2.length();
        int baseLen = base.length();

        StringBuilder result = new StringBuilder();  // 从低位到高位存储结果
        int carry = 0;  // 进位值
        int i = 0;  // 当前处理的位数（从0开始，即个位）

        // 从低位到高位逐位相加，直到所有位处理完且无进位
        while (i < len1 || i < len2 || carry > 0) {
            // 获取两个数当前位的数字，位数不足则补0
            int d1 = i < len1 ? (num1.charAt(len1 - 1 - i) - '0') : 0;
            int d2 = i < len2 ? (num2.charAt(len2 - 1 - i) - '0') : 0;

            // 获取当前位的进制：进制表中'0'表示十进制
            int radix;
            if (i < baseLen) {
                radix = base.charAt(baseLen - 1 - i) - '0';
                if (radix == 0) {  // 0表示十进制
                    radix = 10;
                }
            } else {
                radix = 10;  // 超出进制表长度的位默认为十进制
            }

            // 当前位相加，考虑进位
            int sum = d1 + d2 + carry;
            result.append(sum % radix);  // 当前位的结果
            carry = sum / radix;  // 计算进位
            i++;
        }

        // 去除前导零（结果字符串是从低位到高位存储的，前导零在末尾）
        while (result.length() > 1 && result.charAt(result.length() - 1) == '0') {
            result.deleteCharAt(result.length() - 1);
        }
        
        System.out.println(result.reverse().toString());
    }
}
