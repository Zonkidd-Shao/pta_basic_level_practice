/*
 * 题目：1067 试密码
 * 实现原理：
 *   用户尝试登录，输入密码进行验证。最多允许尝试N次。
 *   规则：
 *   - 输入正确密码：输出"Welcome in"并结束
 *   - 输入错误密码：输出"Wrong password: xxx"，累计次数
 *   - 输入"#"：直接结束
 *   - 尝试次数达到N次：输出"Account locked"并结束
 *   算法步骤：
 *   1. 读取正确密码和最大尝试次数N
 *   2. 循环读取用户输入，直到满足结束条件
 */
#include <stdio.h>
#include <string.h>

int main() {
    char password[21], input[500];  // password: 正确密码; input: 每次尝试的输入
    int N, count = 0;  // N: 最多尝试次数; count: 已尝试次数
    
    scanf("%s %d", password, &N);
    getchar();  // 吃掉第一行末尾的换行符
    
    while (1) {  // 循环读取尝试，直到结束
        scanf("%[^\n]", input);  // 读入一整行（可含空格）
        getchar();
        
        if (strcmp(input, "#") == 0) {  // 输入 '#' 直接结束
            break;
        }
        
        count++;
        if (strcmp(password, input) == 0) {  // 密码正确：欢迎并结束
            printf("Welcome in\n");
            break;
        } else {  // 密码错误：提示并累计次数
            printf("Wrong password: %s\n", input);
            if (count >= N) {  // 错误次数达到上限：锁定
                printf("Account locked\n");
                break;
            }
        }
    }
    
    return 0;
}