// 1009 说反话
// 将一句英语中所有单词的顺序颠倒输出（单词间以单个空格分隔）。
//
// 【实现原理】
// 算法思路：
//   1. 使用 getline() 读取包含空格的一整行字符串。
//   2. 使用 istringstream 按空白字符将句子切分为单词，存入 vector。
//   3. 从 vector 尾部向头部遍历输出单词，单词之间用空格分隔。
// 关键点：
//   - 使用 getline 而非 cin >>，因为句子中包含空格。
//   - istringstream 的 >> 操作符会自动跳过空白字符，方便地实现单词分割。
// 时间复杂度：O(L)，其中 L 为字符串总长度。
// 空间复杂度：O(L)，需要存储所有单词。
#include <iostream>
#include <string>
#include <sstream>
#include <vector>

using namespace std;

int main() {
    string line;
    if (!getline(cin, line)) return 0;

    istringstream iss(line);
    vector<string> words;
    string w;
    while (iss >> w) words.push_back(w); // 按空白切分单词

    for (int i = (int)words.size() - 1; i >= 0; --i) {
        if (i < (int)words.size() - 1) cout << ' ';
        cout << words[i];
    }
    cout << endl;
    return 0;
}