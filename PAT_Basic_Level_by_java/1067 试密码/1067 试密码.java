import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1067 试密码
 *
 * 题目描述：
 * 当你试图登录某个系统却忘了密码时，系统一般只会允许你尝试有限多次，当超出允许次数时，
 * 账号就会被锁死。本题要求实现一个模拟密码验证的功能。
 * 给定一个正确密码（不含空格）和允许的最大尝试次数N，每次输入一个密码进行验证，
 * 直到输入#结束，或密码正确登录成功，或错误次数达到上限被锁定。
 *
 * 实现原理：
 * 解题思路：
 * 1. 读取正确密码和最大尝试次数N
 * 2. 使用循环逐行读取用户输入的密码
 * 3. 若输入为#，则退出验证流程
 * 4. 若输入与正确密码匹配，输出"Welcome in"并结束程序
 * 5. 若输入与正确密码不匹配，输出错误信息并累计错误次数
 * 6. 当错误次数达到N时，输出"Account locked"并结束程序
 *
 * 算法核心逻辑：
 * - 使用BufferedReader逐行读取输入，性能优于Scanner
 * - 通过计数器wrongCount记录连续错误次数
 * - 输入#作为退出条件，不计入错误次数
 *
 * 时间复杂度：O(K)，其中K为实际输入的密码行数
 * 空间复杂度：O(1)，仅使用常数额外空间
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split("\\s+");
        String correctPassword = firstLine[0];  // 正确密码
        int N = Integer.parseInt(firstLine[1]);  // 最大允许尝试次数

        int wrongCount = 0;  // 错误次数计数器
        while (true) {
            String input = br.readLine();
            if (input.equals("#")) {  // 输入#结束验证
                break;
            }
            if (input.equals(correctPassword)) {  // 密码正确，登录成功
                System.out.println("Welcome in");
                return;
            } else {  // 密码错误
                wrongCount++;
                System.out.println("Wrong password: " + input);
                if (wrongCount >= N) {  // 错误次数达到上限，锁定账号
                    System.out.println("Account locked");
                    return;
                }
            }
        }
    }
}
