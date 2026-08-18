/*
 * 1110 区块反转
 * 
 * 题目描述：
 *     给定一个单链表L和一个正整数K，将链表按每K个节点为一个区块
 *     进行划分，然后反转区块的顺序（注意：区块内节点顺序保持不变）。
 *     输出反转后的链表。
 *     例如：链表1→2→3→4→5→6→7，K=3，
 *           区块划分为[1,2,3] [4,5,6] [7]，
 *           反转区块顺序后为[7] [4,5,6] [1,2,3]。
 * 
 * 实现原理：
 *     解题思路：
 *         1. 使用HashMap以节点地址为键存储所有节点。
 *         2. 从头节点开始遍历链表，将节点按顺序存入List。
 *         3. 将List按每K个节点切分为区块（最后一个区块可能不足K个）。
 *         4. 反转区块的顺序（整个区块为单位反转，区块内节点顺序不变）。
 *         5. 遍历反转后的结果列表，更新每个节点的next指针指向下一节点地址。
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
        String head = firstLine[0];          // 链表头节点地址
        int n = Integer.parseInt(firstLine[1]);  // 节点总数
        int k = Integer.parseInt(firstLine[2]);  // 区块大小
        
        // 用HashMap存储所有节点，地址作为键
        Map<String, Node> nodes = new HashMap<>();
        for (int i = 0; i < n; i++) {
            String[] parts = br.readLine().split(" ");
            nodes.put(parts[0], new Node(parts[0], Integer.parseInt(parts[1]), parts[2]));
        }
        
        // 从头节点开始遍历，按顺序构建链表
        List<Node> list = new ArrayList<>();
        String curr = head;
        while (!curr.equals("-1")) {
            Node node = nodes.get(curr);
            list.add(node);
            curr = node.next;  // 移动到下一个节点
        }
        
        // 将链表分成区块，每K个节点为一个区块（最后一个区块可能不足K个）
        List<List<Node>> blocks = new ArrayList<>();
        for (int i = 0; i < list.size(); i += k) {
            int end = Math.min(i + k, list.size());
            blocks.add(new ArrayList<>(list.subList(i, end)));
        }
        
        // 反转区块的顺序（区块整体反转，而非区块内节点反转）
        List<Node> result = new ArrayList<>();
        for (int i = blocks.size() - 1; i >= 0; i--) {
            result.addAll(blocks.get(i));
        }
        
        // 输出反转后的链表，更新每个节点的next指针
        for (int i = 0; i < result.size(); i++) {
            Node node = result.get(i);
            String nextAddr = (i == result.size() - 1) ? "-1" : result.get(i + 1).address;
            System.out.println(node.address + " " + node.data + " " + nextAddr);
        }
    }
}
