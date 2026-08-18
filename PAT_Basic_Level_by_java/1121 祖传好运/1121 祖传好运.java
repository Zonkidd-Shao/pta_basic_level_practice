/*
 * 1121 祖传好运
 * 
 * 题目描述：
 *     给定一个数字，定义"祖传好运数"：从高位到低位依次取前缀，
 *     每个前缀（从 1 位数开始）必须能被其位数整除。
 *     例如，数字 123：1 能被 1 整除，12 能被 2 整除，123 能被 3 整除，因此是祖传好运数。
 *     给定 K 个数字，判断每个数字是否是祖传好运数。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 将数字作为字符串处理，逐位构建前缀数值。
 *       2. 对于每个前缀（从第 2 位开始），检查前缀能否被其位数整除。
 *       3. 由于 1 位数一定能被 1 整除，所以从长度 > 1 开始检查。
 *     算法核心逻辑：
 *       - 逐位构造前缀数值（prefix = prefix * 10 + digit），
 *         每次检查当前前缀 % 当前长度 == 0。
 *     时间复杂度：O(K * L)，其中 L 为每个数字的位数。
 *     空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int k = Integer.parseInt(br.readLine());
        String[] nums = br.readLine().split(" ");
        
        for (int i = 0; i < k; i++) {
            String numStr = nums[i];
            if (isGoodLuck(numStr)) {
                System.out.println("Yes");
            } else {
                System.out.println("No");
            }
        }
        
        br.close();
    }
    
    /**
     * 判断一个数字是否是祖传好运数
     * 逐位构建前缀，检查每个前缀是否能被其位数整除
     * @param numStr 数字字符串
     * @return true 表示是祖传好运数
     */
    private static boolean isGoodLuck(String numStr) {
        long prefix = 0;
        
        for (int i = 0; i < numStr.length(); i++) {
            int digit = numStr.charAt(i) - '0';
            prefix = prefix * 10 + digit; // 构建当前前缀
            int len = i + 1; // 当前前缀的位数
            
            // 检查当前前缀能否被其位数整除
            // 1 位数一定是好运数（能被 1 整除），不需要检查
            if (len > 1 && prefix % len != 0) {
                return false;
            }
        }
        
        return true;
    }
}
