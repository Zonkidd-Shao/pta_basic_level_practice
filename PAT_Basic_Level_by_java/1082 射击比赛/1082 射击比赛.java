/**
 * 1082 射击比赛
 * 
 * 题目描述：
 * 给定 N 名选手的射击坐标（x, y），计算每名选手到靶心（原点）的距离，
 * 找出距离最近的选手（冠军）和距离最远的选手（菜鸟），输出他们的编号。
 * 
 * 实现原理：
 * 解题思路：
 * - 计算每个坐标到原点的距离平方（x²+y²），避免开方运算以提高效率
 * - 遍历所有选手，记录最小距离平方和最大距离平方对应的选手编号
 * - 比较距离平方等同于比较距离，因为平方函数在非负数域是单调递增的
 * 
 * 算法核心逻辑：
 * - 使用 int 计算距离平方，避免浮点数精度问题和 sqrt 性能开销
 * - 用 minDistSq 和 maxDistSq 分别记录最小和最大距离平方
 * - 同时更新对应的冠军（championId）和菜鸟（rookieId）编号
 * 
 * 时间复杂度：O(N)，只需一次线性遍历即可找出最远和最近的点
 * 空间复杂度：O(1)，仅需常数额外空间
 */
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        
        int N = Integer.parseInt(br.readLine());
        
        // 冠军（距离最近）和菜鸟（距离最远）的编号
        String championId = "";
        String rookieId = "";
        int minDistSq = Integer.MAX_VALUE; // 最小距离平方，初始化为最大值
        int maxDistSq = Integer.MIN_VALUE; // 最大距离平方，初始化为最小值
        
        for (int i = 0; i < N; i++) {
            String[] line = br.readLine().split(" ");
            String id = line[0];
            int x = Integer.parseInt(line[1]);
            int y = Integer.parseInt(line[2]);
            
            // 计算距离平方（避免开方，提高效率）
            int distSq = x * x + y * y;
            
            // 更新冠军：距离越小越好
            if (distSq < minDistSq) {
                minDistSq = distSq;
                championId = id;
            }
            
            // 更新菜鸟：距离越大越好
            if (distSq > maxDistSq) {
                maxDistSq = distSq;
                rookieId = id;
            }
        }
        
        // 输出冠军和菜鸟的编号
        System.out.println(championId + " " + rookieId);
    }
}
