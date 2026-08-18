import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1076 Wifi密码
 *
 * 题目描述：
 * 下面是微博上流传的一张照片："各位亲爱的同学们，鉴于大家有时需要使用wifi，
 * 又怕耽误亲们的学习，现将wifi密码设置为下列数学题答案：A-1；B-2；C-3；D-4；
 * 请同学们自己作答，每两日一换。谢谢合作！！"——本题要求根据题目给出的选项
 * 信息，找出每道题的正确选项（标记为T），转换为对应的数字，拼接成wifi密码。
 *
 * 实现原理：
 * 解题思路：
 * 1. 读取题目数量N
 * 2. 循环N次，每次读取一行4个选项（如"A-T"表示选项A是正确答案）
 * 3. 遍历每个选项字符串，检查是否以"-T"结尾，若是则找到正确答案
 * 4. 将选项字母A~D转换为数字1~4（通过字符运算 c - 'A' + 1）
 * 5. 将数字追加到StringBuilder中，最后输出完整的密码字符串
 *
 * 算法核心逻辑：
 * - 使用StringBuilder高效拼接密码字符串
 * - 通过endsWith("-T")快速判断选项是否为正确答案
 * - 字符运算 c - 'A' + 1 将字母A~D转换为数字1~4
 *
 * 时间复杂度：O(N×4)，遍历N行每行4个选项
 * 空间复杂度：O(N)，存储密码字符串
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine().trim());
        StringBuilder password = new StringBuilder();
        
        for (int i = 0; i < N; i++) {
            String[] options = br.readLine().trim().split(" ");  // 4个选项，如"A-T B-F C-F D-F"
            for (String opt : options) {
                // 找到标记为"-T"的选项，即为正确答案
                if (opt.endsWith("-T")) {
                    char c = opt.charAt(0);  // 获取选项字母 A~D
                    password.append(c - 'A' + 1);  // 转换为数字 1~4
                    break;  // 每题只有一个正确选项，找到后退出内层循环
                }
            }
        }
        
        System.out.println(password.toString());
    }
}
