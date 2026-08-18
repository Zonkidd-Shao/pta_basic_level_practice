import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/**
 * 1041 考试座位号
 *
 * 题目描述：
 * 记录每位考生的准考证号和考试座位号，按照试机座位号建立索引。给定若干查询的
 * 试机座位号，输出对应的准考证号和考试座位号。
 *
 * 实现原理：
 * 1. 定义 Stu 类存储准考证号(id)和考试座位号(examSeat)。
 * 2. 由于试机座位号范围有限（题目通常不超过 1000），直接使用长度为 1001 的
 *    数组，以试机座位号为下标进行 O(1) 存取。
 * 3. 读取 N 条考生记录，将考生信息存入 arr[trial]。
 * 4. 读取 M 个查询，直接通过数组下标 arr[t] 获取对应信息并输出。
 *
 * 时间复杂度：O(N + M)，空间复杂度 O(1001)
 * 利用试机座位号作为数组索引，避免了 HashMap 的开销。
 */
public class Main {
    static class Stu {
        String id;
        int examSeat;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine().trim());
        Stu[] arr = new Stu[1001];
        for (int i = 0; i < n; i++) {
            String[] p = br.readLine().trim().split("\\s+");
            int trial = Integer.parseInt(p[1]);
            Stu s = new Stu();
            s.id = p[0];
            s.examSeat = Integer.parseInt(p[2]);
            arr[trial] = s;
        }
        // 根据试机座位号直接查表输出
        int m = Integer.parseInt(br.readLine().trim());
        String[] q = br.readLine().trim().split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < m; i++) {
            int t = Integer.parseInt(q[i]);
            sb.append(arr[t].id).append(' ').append(arr[t].examSeat).append('\n');
        }
        System.out.print(sb);
    }
}
