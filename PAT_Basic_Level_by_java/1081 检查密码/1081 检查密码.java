/**
 * 1081 检查密码
 * 
 * 题目描述：
 * 检查用户设置的密码是否合法。密码要求：
 * 1. 长度至少为6位
 * 2. 只能包含字母、数字和小数点（.）
 * 3. 必须同时包含字母和数字
 * 输出规则：根据不同违规情况输出对应提示信息（优先级：长度不足 > 包含非法字符 > 缺少数字 > 缺少字母）。
 * 
 * 实现原理：
 * 解题思路：
 * - 遍历密码字符串的每个字符，分别判断是否包含字母、数字、非法字符
 * - 根据检查结果按照优先级输出对应的提示信息
 * - 注意小数点（.）是唯一合法的非字母数字字符
 * 
 * 算法核心逻辑：
 * - 使用 Character.isLetter() 和 Character.isDigit() 判断字母和数字
 * - 用三个布尔变量记录检查结果：hasLetter、hasDigit、hasIllegal
 * - 按优先级顺序输出：非法字符 > 缺数字 > 缺字母 > 完美
 * 
 * 时间复杂度：O(n×m)，n为密码个数，m为最长密码长度
 * 空间复杂度：O(1)，仅需常数额外空间
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int N = Integer.parseInt(br.readLine());
        
        for (int i = 0; i < N; i++) {
            String password = br.readLine();
            
            // 首先检查长度是否小于6
            if (password.length() < 6) {
                System.out.println("Your password is tai duan le.");
                continue;
            }
            
            boolean hasLetter = false;
            boolean hasDigit = false;
            boolean hasIllegal = false;
            
            // 遍历每个字符检查合法性
            for (int j = 0; j < password.length(); j++) {
                char c = password.charAt(j);
                
                if (Character.isLetter(c)) {
                    hasLetter = true;
                } else if (Character.isDigit(c)) {
                    hasDigit = true;
                } else if (c == '.') {
                    // 小数点是合法字符，不做任何标记
                } else {
                    // 遇到非法字符（非字母、非数字、非小数点）
                    hasIllegal = true;
                }
            }
            
            // 按照优先级输出结果：非法字符 > 缺数字 > 缺字母 > 完美
            if (hasIllegal) {
                System.out.println("Your password is tai luan le.");
            } else if (!hasDigit) {
                System.out.println("Your password needs shu zi.");
            } else if (!hasLetter) {
                System.out.println("Your password needs zi mu.");
            } else {
                System.out.println("Your password is wan mei.");
            }
        }
    }
}
