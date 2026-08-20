/*
 * 1109 擅长C
 * 直接复制 by_c 逻辑转为 C++：点阵打印
 */
#include <bits/stdc++.h>
using namespace std;
string letters[26][7];
void print_word(const string& word){
    int len=word.size();
    for(int i=0;i<7;++i){
        for(int j=0;j<len;++j){
            int idx=word[j]-'A';
            cout<<letters[idx][i];
            if(j<len-1) cout<<' ';
        }
        cout<<"\n";
    }
}
int main(){
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    for(int i=0;i<26;++i) for(int j=0;j<7;++j) if(!(cin>>letters[i][j])) return 0;
    cin.ignore(numeric_limits<streamsize>::max(), '\n');
    string sentence;
    getline(cin, sentence);
    string word;
    bool first=true;
    for(size_t i=0;i<=sentence.size();++i){
        bool isUpper = (i < sentence.size() && sentence[i]>='A' && sentence[i]<='Z');
        if(i==sentence.size() || !isUpper){
            if(!word.empty()){
                if(!first) cout<<"\n";
                print_word(word);
                first=false;
                word.clear();
            }
        }else word.push_back(sentence[i]);
    }
    return 0;
}
