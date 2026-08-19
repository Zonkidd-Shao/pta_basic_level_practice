/*
 * 题目编号：1025 反转链表
 * 
 * 题目描述：
 *   给定一个单链表，每 K 个结点为一组进行反转，最后不足 K 个的结点保持原序，
 *   输出反转后的完整链表（地址、数据、下一结点地址）。
 *
 * 实现原理：
 *   解题思路：由于结点地址为字符串（5 位数字），不方便直接用指针操作链表，
 *   先用 HashMap 以地址为键存储所有结点，再按链表顺序将地址提取到 ArrayList 中，
 *   然后在 ArrayList 上对每 K 个元素进行反转，最后按反转后的顺序输出。
 *   算法核心逻辑：
 *     1. 用 HashMap<String, Node> 存储所有结点，Node 包含 data 和 next 地址。
 *     2. 从 head 开始遍历链表，将结点地址按顺序存入 ArrayList<String>。
 *     3. 对 ArrayList 中每连续 K 个元素调用 reverse() 方法进行原地反转。
 *     4. 按反转后的地址顺序输出，同时更新每个结点的 next 指针为下一结点的地址。
 *   时间复杂度：O(n)，n 为链表有效结点数。空间复杂度：O(n)。
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class Main {
    // 链表结点类，data 为数据域，next 为下一结点地址
    static class Node {
        int data;
        String next;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] first = br.readLine().trim().split("\\s+");
        String head = first[0];       // 首结点地址
        int n = Integer.parseInt(first[1]); // 结点总数
        int k = Integer.parseInt(first[2]); // 每组大小

        // 读取所有结点，以地址为键存入 HashMap
        HashMap<String, Node> map = new HashMap<>();
        for (int i = 0; i < n; i++) {
            String[] p = br.readLine().trim().split("\\s+");
            Node node = new Node();
            node.data = Integer.parseInt(p[1]);
            node.next = p[2];
            map.put(p[0], node);
        }

        // 按链表顺序提取所有结点地址到 ArrayList
        ArrayList<String> list = new ArrayList<>();
        String cur = head;
        while (!cur.equals("-1")) {
            list.add(cur);
            cur = map.get(cur).next;
        }

        // 每 K 个一组进行反转
        int size = list.size();
        int i = 0;
        while (i + k <= size) {
            reverse(list, i, i + k - 1);
            i += k;
        }

        // 输出反转后的链表，每个结点的 next 更新为下一个结点地址
        StringBuilder sb = new StringBuilder();
        for (int j = 0; j < size; j++) {
            String addr = list.get(j);
            String nxt = (j == size - 1) ? "-1" : list.get(j + 1);
            sb.append(addr).append(' ').append(map.get(addr).data).append(' ').append(nxt).append('\n');
        }
        System.out.print(sb);
    }

    // 对 ArrayList 中下标 a 到 b（含）范围内的元素进行原地反转
    private static void reverse(ArrayList<String> l, int a, int b) {
        while (a < b) {
            String t = l.get(a);
            l.set(a, l.get(b));
            l.set(b, t);
            a++;
            b--;
        }
    }
}
