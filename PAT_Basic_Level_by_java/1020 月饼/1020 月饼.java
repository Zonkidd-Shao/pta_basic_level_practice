/*
 * 题目编号：1020 月饼
 * 题目描述：月饼是中国人在中秋佳节时吃的一种传统食品。给定所有种类月饼的库存量、总售价以及市场
 *   的最大需求量，请你计算可以获得的最大收益是多少。
 *   注意：销售时可以只取部分库存，而不是全部。每种月饼的库存量和总售价均为正数。
 * 实现原理：
 *   解题思路：贪心算法。
 *   - 计算每种月饼的单价（总售价/库存量），单价越高越优先销售。
 *   - 将所有月饼按单价从高到低排序。
 *   - 遍历排序后的月饼，如果当前库存量 ≤ 剩余需求量，则全部卖出，收益加上总售价；
 *     否则只卖出需求量部分，收益加上 单价 × 剩余需求量，并结束循环。
 * 时间复杂度：O(n log n)，其中n为月饼种类数，排序为主要耗时操作。
 * 空间复杂度：O(n)，需要存储所有种类月饼的信息。
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;

/**
 * 1020 月饼
 * 已知每种月饼库存量与总售价及最大需求量，按单价从高到低贪心求最大收益。
 */
public class Main {
    // 月饼类，包含库存量、总售价和单价
    static class Moon {
        double stock, price, unit;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] first = br.readLine().trim().split("\\s+");
        int n = Integer.parseInt(first[0]);   // 月饼种类数
        double d = Double.parseDouble(first[1]);  // 最大需求量
        String[] stockStr = br.readLine().trim().split("\\s+");
        String[] priceStr = br.readLine().trim().split("\\s+");
        Moon[] moons = new Moon[n];
        // 读取每种月饼的库存和总售价，计算单价
        for (int i = 0; i < n; i++) {
            moons[i] = new Moon();
            moons[i].stock = Double.parseDouble(stockStr[i]);
            moons[i].price = Double.parseDouble(priceStr[i]);
            moons[i].unit = moons[i].price / moons[i].stock;  // 计算单价
        }
        // 按单价从高到低排序
        Arrays.sort(moons, new Comparator<Moon>() {
            public int compare(Moon a, Moon b) {
                return Double.compare(b.unit, a.unit);
            }
        });
        double profit = 0;
        // 贪心：优先销售单价高的月饼
        for (int i = 0; i < n && d > 0; i++) {
            if (moons[i].stock <= d) {
                profit += moons[i].price;    // 全部卖出
                d -= moons[i].stock;
            } else {
                profit += moons[i].unit * d;  // 卖出部分，满足剩余需求
                d = 0;
            }
        }
        // 输出结果，保留2位小数
        System.out.printf("%.2f\n", profit);
    }
}