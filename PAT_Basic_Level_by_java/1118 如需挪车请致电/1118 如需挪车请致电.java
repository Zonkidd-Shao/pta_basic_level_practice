/*
 * 1118 如需挪车请致电
 * 
 * 题目描述：
 *     给定 11 行表达式，每行表达式可能是以下之一：
 *       - 中文数字拼音（如 "yi", "er", ...），直接映射为数字。
 *       - 开平方运算（如 "sqrt16"），取整数部分。
 *       - 二元运算（如 "3+5", "7*8"），运算符包括 +、-、*、/、%、^。
 *       - 纯数字（如 "123"），直接返回。
 *     计算每个表达式的值，组合成 11 位电话号码并输出。
 * 
 * 实现原理：
 *     解题思路：
 *       1. 建立拼音到数字的映射表。
 *       2. 对每个表达式，依次判断：
 *          (a) 是否是拼音映射表中的键；
 *          (b) 是否以 "sqrt" 开头（开平方运算）；
 *          (c) 是否包含二元运算符（从位置 1 开始查找，避免将负号当作减号）；
 *          (d) 否则作为纯数字解析。
 *       3. 将 11 个数字拼接为字符串输出。
 *     算法核心逻辑：
 *       - 表达式解析：按优先级依次匹配各种模式，找到匹配项后计算。
 *     时间复杂度：O(11 * len(expr))，输入固定为 11 行。
 *     空间复杂度：O(1)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public class Main {
    // 中文数字拼音到数字（0~9）的映射表
    private static final Map<String, Integer> pinyinMap = new HashMap<>();
    
    static {
        pinyinMap.put("ling", 0);
        pinyinMap.put("yi", 1);
        pinyinMap.put("er", 2);
        pinyinMap.put("san", 3);
        pinyinMap.put("si", 4);
        pinyinMap.put("wu", 5);
        pinyinMap.put("liu", 6);
        pinyinMap.put("qi", 7);
        pinyinMap.put("ba", 8);
        pinyinMap.put("jiu", 9);
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        StringBuilder phoneNumber = new StringBuilder();
        
        // 读取 11 行表达式，逐行计算并拼接
        for (int i = 0; i < 11; i++) {
            String expr = br.readLine();
            int digit = calculate(expr);
            phoneNumber.append(digit);
        }
        
        System.out.println(phoneNumber);
        br.close();
    }
    
    /**
     * 计算表达式的值
     * @param expr 表达式字符串
     * @return 计算结果（一位整数）
     */
    private static int calculate(String expr) {
        // 情况1：中文数字拼音
        if (pinyinMap.containsKey(expr)) {
            return pinyinMap.get(expr);
        }
        
        // 情况2：开平方运算，如 "sqrt16"
        if (expr.startsWith("sqrt")) {
            int num = Integer.parseInt(expr.substring(4));
            return (int) Math.sqrt(num);
        }
        
        // 情况3：二元运算
        // 注意运算符查找从位置 1 开始，避免将开头的负号当作减号
        char[] ops = {'+', '-', '*', '/', '%', '^'};
        
        for (int i = 1; i < expr.length(); i++) {
            char c = expr.charAt(i);
            for (char op : ops) {
                if (c == op) {
                    // 找到运算符，分割左右运算数
                    int left = Integer.parseInt(expr.substring(0, i));
                    int right = Integer.parseInt(expr.substring(i + 1));
                    return compute(left, right, op);
                }
            }
        }
        
        // 情况4：纯数字
        return Integer.parseInt(expr);
    }
    
    /**
     * 执行二元运算
     * @param left  左操作数
     * @param right 右操作数
     * @param op    运算符（+、-、*、/、%、^）
     * @return 运算结果
     */
    private static int compute(int left, int right, char op) {
        switch (op) {
            case '+':
                return left + right;
            case '-':
                return left - right;
            case '*':
                return left * right;
            case '/':
                return left / right;
            case '%':
                return left % right;
            case '^':
                return (int) Math.pow(left, right); // 乘方运算
            default:
                return 0;
        }
    }
}
