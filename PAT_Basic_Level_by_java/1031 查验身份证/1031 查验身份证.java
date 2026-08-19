/*
 * 题目编号：1031 查验身份证
 * 
 * 题目描述：
 *   一个合法的 18 位身份证号由 17 位数字和 1 位校验码组成。
 *   校验规则：前 17 位数字分别乘以对应权重后求和，再对 11 取模，
 *   得到校验码索引，对照校验码表得到正确的校验字符。
 *   输出所有不合法的身份证号，若全部合法则输出 "All passed"。
 *
 * 实现原理：
 *   解题思路：定义权重数组 W[17] 和校验码数组 CODE[11]，对每个身份证号逐一校验。
 *   校验方法 isValid() 中先检查长度是否为 18，再检查前 17 位是否全为数字，
 *   然后计算加权和并对 11 取模，最后比较末位字符与 CODE[sum % 11] 是否一致。
 *   算法核心逻辑：
 *     1. 权重数组 W = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2}。
 *     2. 校验码数组 CODE = {'1','0','X','9','8','7','6','5','4','3','2'}。
 *     3. 遍历每个身份证号，调用 isValid() 校验，不合法则加入输出列表。
 *     4. 若全部合法输出 "All passed"，否则输出所有不合法的号码。
 *   时间复杂度：O(N * 18) = O(N)，N 为身份证号个数。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    // 前 17 位的权重
    private static final int[] W = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};
    // 模 11 对应的校验码字符
    private static final char[] CODE = {'1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'};

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        boolean allPass = true;
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < n; i++) {
            String id = br.readLine().trim();
            if (!isValid(id)) {
                allPass = false;
                sb.append(id).append('\n');
            }
        }

        if (allPass) System.out.println("All passed");
        else System.out.print(sb);
    }

    // 校验单个身份证号是否合法
    private static boolean isValid(String id) {
        if (id.length() != 18) return false;

        int sum = 0;
        // 计算前 17 位的加权和
        for (int i = 0; i < 17; i++) {
            char c = id.charAt(i);
            if (c < '0' || c > '9') return false; // 非数字则不合法
            sum += (c - '0') * W[i];
        }

        // 校验最后一位是否与计算出的校验码一致
        return id.charAt(17) == CODE[sum % 11];
    }
}
