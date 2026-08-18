/**
 * 1052 卖个萌
 * 
 * 题目描述：
 * 萌萌哒表情符号通常由手、眼、口三个基本部分组成。
 * 给定三行字符串，分别代表可用的手、眼、口符号集合（每个符号用方括号 [] 包裹）。
 * 用户给定 K 个请求，每个请求给出 5 个序号（左手、左眼、口、右眼、右手），
 * 程序按要求输出对应的表情。若序号超出范围，则输出 "Are you kidding me? @\\/@"
 * 
 * 实现原理：
 * 解题思路：
 * 1. 使用正则表达式 \\[([^\\]]+)\\] 从每行中提取方括号内的符号内容。
 * 2. 将提取出的手、眼、口符号分别存储在三个 List<String> 中。
 * 3. 对每个用户请求，检查 5 个序号是否在有效范围内（1 到对应列表大小）。
 * 4. 若合法，按 "[左手](左眼口右眼)[右手]" 的格式拼接输出；
 *    若不合法，输出预设的调侃语句。
 * 
 * 核心思想：正则解析 + 列表存储 + 下标映射。注意序号从 1 开始，需减 1 转换为下标。
 * 
 * 时间复杂度：O(N + K)，N 为符号总数，K 为用户请求数，空间复杂度：O(N)
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // 解析手、眼、口的符号集合
        List<String> hands = parseSymbols(br.readLine());
        List<String> eyes = parseSymbols(br.readLine());
        List<String> mouths = parseSymbols(br.readLine());

        int K = Integer.parseInt(br.readLine().trim());

        // 处理每个用户请求
        for (int i = 0; i < K; i++) {
            String[] parts = br.readLine().trim().split("\\s+");
            int leftHand = Integer.parseInt(parts[0]);
            int leftEye = Integer.parseInt(parts[1]);
            int mouth = Integer.parseInt(parts[2]);
            int rightEye = Integer.parseInt(parts[3]);
            int rightHand = Integer.parseInt(parts[4]);

            // 检查所有序号是否合法（序号从 1 开始）
            if (leftHand < 1 || leftHand > hands.size() ||
                rightHand < 1 || rightHand > hands.size() ||
                leftEye < 1 || leftEye > eyes.size() ||
                rightEye < 1 || rightEye > eyes.size() ||
                mouth < 1 || mouth > mouths.size()) {
                System.out.println("Are you kidding me? @\\/@");
            } else {
                // 按格式拼接表情：[左手](左眼口右眼)[右手]
                System.out.println(hands.get(leftHand - 1) + "(" +
                    eyes.get(leftEye - 1) + mouths.get(mouth - 1) + eyes.get(rightEye - 1) + ")" +
                    hands.get(rightHand - 1));
            }
        }
    }

    /**
     * 从字符串中解析方括号 [] 内的符号
     * @param line 包含符号的原始字符串
     * @return 符号列表
     */
    private static List<String> parseSymbols(String line) {
        List<String> symbols = new ArrayList<>();
        Pattern pattern = Pattern.compile("\\[([^\\]]+)\\]");
        Matcher matcher = pattern.matcher(line);
        while (matcher.find()) {
            symbols.add(matcher.group(1));
        }
        return symbols;
    }
}
