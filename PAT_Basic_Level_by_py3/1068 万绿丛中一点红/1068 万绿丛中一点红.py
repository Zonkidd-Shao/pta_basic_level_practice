# 题目：1068 万绿丛中一点红
#
# 题目描述：
#   对于计算机而言，颜色不过是像素点对应的一个 24 位的数值。现给定一幅分辨率为 M\times N 的画，要求你找出万绿丛中的一点红，即有独一无二颜色的那个像素点，并且该点的颜色与其周围 8 个相邻像素的颜色差充分大。
#
# 输入格式：
#   输入第一行给出三个正整数，分别是 M 和 N（\le 1000），即图像的分辨率；以及 TOL，是所求像素点与相邻点的颜色差阈值，色差超过 TOL 的点才被考虑。随后 N 行，每行给出 M 个像素的颜色值，范围在 [0, 2^{24}) 内。所有同行数字间用空格或 TAB 分开。
#
# 输出格式：
#   在一行中按照 `(x, y): color` 的格式输出所求像素点的位置以及颜色值，其中位置 `x` 和 `y` 分别是该像素在图像矩阵中的列、行编号（从 1 开始编号）。如果这样的点不唯一，则输出 `Not Unique`；如果这样的点不存在，则输出 `Not Exist`。
#
# 实现原理：
#   - 循环迭代处理
#   - 列表操作
#
# 算法思路：
#   像素点查找：在图像中找出与众不同的像素点，
#   检查周围8个方向的颜色差异。
#
import sys
from collections import Counter

m,n,tol=map(int,sys.stdin.readline().split()); a=[list(map(int,sys.stdin.readline().split())) for _ in range(n)]; c=Counter(sum(a,[])); ans=[]
for i in range(n):
 for j in range(m):
  x=a[i][j]
  if c[x]==1 and all(abs(x-a[y][z])>tol for y in range(max(0,i-1),min(n,i+2)) for z in range(max(0,j-1),min(m,j+2))): ans.append((j+1,i+1,x))
print('Not Exist' if not ans else ('Not Unique' if len(ans)>1 else f'({ans[0][0]}, {ans[0][1]}): {ans[0][2]}'))
