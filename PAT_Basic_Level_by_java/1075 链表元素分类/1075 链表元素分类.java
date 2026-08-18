import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 1075 链表元素分类
 *
 * 题目描述：
 * 给定一个单链表，要求将链表中的元素按以下规则重新排列：
 * 所有负值元素排在前面，然后是在[0, K]区间内的元素，最后是大于K的元素。
 * 每类内部元素的相对顺序保持不变（即稳定排序）。
 * 输出重新排列后的链表。
 *
 * 实现原理：
 * 解题思路：
 * 1. 使用数组data[100000]和next[100000]以地址为下标存储链表节点信息
 * 2. 遍历链表，将节点地址按数据值分类存入三个ArrayList：
 *    - list1：数据值 < 0
 *    - list2：0 ≤ 数据值 ≤ K
 *    - list3：数据值 > K
 * 3. 按list1、list2、list3的顺序合并成一个结果列表
 * 4. 遍历结果列表，输出每个节点的地址、数据和下一个节点的地址
 *
 * 算法核心逻辑：
 * - 由于地址范围固定（0~99999），使用数组模拟链表，无需创建节点类
 * - 三个ArrayList分别存储三类节点的地址，保持原始顺序
 * - 输出时通过result.get(i+1)获取下一个节点的地址作为next指针
 * - 最后一个节点输出-1作为终止标记
 *
 * 时间复杂度：O(N)，遍历链表和输出各一次
 * 空间复杂度：O(N + 100000)，N为有效节点数，100000为数组大小
 */
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().trim().split(" ");
        int head = Integer.parseInt(firstLine[0]);
        int N = Integer.parseInt(firstLine[1]);
        int K = Integer.parseInt(firstLine[2]);
        
        // 使用数组以地址为下标存储链表节点信息，地址范围0~99999
        int[] data = new int[100000];  // data[addr] = 节点数据值
        int[] next = new int[100000];  // next[addr] = 下一个节点地址

        // 读取所有节点信息
        for (int i = 0; i < N; i++) {
            String[] parts = br.readLine().trim().split(" ");
            int addr = Integer.parseInt(parts[0]);
            data[addr] = Integer.parseInt(parts[1]);
            next[addr] = Integer.parseInt(parts[2]);
        }

        // 按数据值分类存储节点地址，保持原始顺序
        List<Integer> list1 = new ArrayList<>();  // 数据值 < 0
        List<Integer> list2 = new ArrayList<>();  // 0 ≤ 数据值 ≤ K
        List<Integer> list3 = new ArrayList<>();  // 数据值 > K

        // 遍历链表，将节点地址按类别放入对应列表
        int p = head;
        while (p != -1) {
            if (data[p] < 0) {
                list1.add(p);
            } else if (data[p] <= K) {
                list2.add(p);
            } else {
                list3.add(p);
            }
            p = next[p];  // 移动到下一个节点
        }

        // 按负值、[0,K]、大于K的顺序合并
        List<Integer> result = new ArrayList<>();
        result.addAll(list1);
        result.addAll(list2);
        result.addAll(list3);

        // 输出重排后的链表
        for (int i = 0; i < result.size(); i++) {
            int addr = result.get(i);
            if (i < result.size() - 1) {
                // 不是最后一个节点，next指向下一个节点地址
                System.out.printf("%05d %d %05d\n", addr, data[addr], result.get(i + 1));
            } else {
                // 最后一个节点，next为-1
                System.out.printf("%05d %d -1\n", addr, data[addr]);
            }
        }
    }
}
