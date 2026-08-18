/*
 * 1105 链表合并
 * 
 * 题目描述：
 *     给定两个单链表L1和L2，将较短的链表逆序后，按每2个长链表节点
 *     插入1个短链表节点的规则合并到长链表中。
 *     输出合并后链表的每个节点的地址、数据和下一个节点地址。
 *     题目保证长链表长度至少是短链表长度的2倍。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 使用HashMap存储所有节点，以节点地址为键，方便O(1)查找。
 *         2. 从两个链表的头节点开始，分别遍历构建两个有序的Node列表。
 *         3. 比较两个链表长度，确定长链表和短链表。
 *         4. 将短链表逆序。
 *         5. 遍历长链表，每放入2个长链表节点，就插入1个短链表节点。
 *         6. 最后遍历结果列表，更新每个节点的next指针并输出。
 *     时间复杂度：O(N)，空间复杂度：O(N)。
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {
    // 链表节点类，包含地址、数据和下一节点地址
    static class Node {
        String address;
        int data;
        String next;
        Node(String addr, int d, String n) {
            address = addr;
            data = d;
            next = n;
        }
    }
    
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] firstLine = br.readLine().split(" ");
        String head1 = firstLine[0];  // 第一条链表的头节点地址
        String head2 = firstLine[1];  // 第二条链表的头节点地址
        int n = Integer.parseInt(firstLine[2]);  // 节点总数
        
        // 用HashMap存储所有节点，地址作为键
        Map<String, Node> nodes = new HashMap<>();
        for (int i = 0; i < n; i++) {
            String[] parts = br.readLine().split(" ");
            nodes.put(parts[0], new Node(parts[0], Integer.parseInt(parts[1]), parts[2]));
        }
        
        // 根据头地址遍历构建两个链表
        List<Node> list1 = buildList(head1, nodes);
        List<Node> list2 = buildList(head2, nodes);
        
        // 确定长链表和短链表
        List<Node> longList, shortList;
        if (list1.size() >= list2.size()) {
            longList = list1;
            shortList = list2;
        } else {
            longList = list2;
            shortList = list1;
        }
        
        // 将短链表逆序
        List<Node> reversedShort = new ArrayList<>();
        for (int i = shortList.size() - 1; i >= 0; i--) {
            reversedShort.add(shortList.get(i));
        }
        
        // 合并链表：长链表每2个节点插入一个短链表节点
        List<Node> result = new ArrayList<>();
        int shortIdx = 0;  // 短链表当前索引
        for (int i = 0; i < longList.size(); i++) {
            result.add(longList.get(i));
            // 每放入2个长链表节点后，插入一个短链表节点
            if ((i + 1) % 2 == 0 && shortIdx < reversedShort.size()) {
                result.add(reversedShort.get(shortIdx));
                shortIdx++;
            }
        }
        
        // 如果短链表还有剩余（题目保证长链表至少是短链表的2倍，所以一般不会有剩余）
        while (shortIdx < reversedShort.size()) {
            result.add(reversedShort.get(shortIdx));
            shortIdx++;
        }
        
        // 输出合并后的链表，更新每个节点的next指针指向下一个节点的地址
        for (int i = 0; i < result.size(); i++) {
            Node node = result.get(i);
            String nextAddr = (i == result.size() - 1) ? "-1" : result.get(i + 1).address;
            System.out.println(node.address + " " + node.data + " " + nextAddr);
        }
    }
    
    // 根据头地址遍历链表，将节点按顺序存入List返回
    static List<Node> buildList(String head, Map<String, Node> nodes) {
        List<Node> list = new ArrayList<>();
        String curr = head;
        while (!curr.equals("-1")) {
            Node node = nodes.get(curr);
            list.add(node);
            curr = node.next;  // 移动到下一个节点
        }
        return list;
    }
}
