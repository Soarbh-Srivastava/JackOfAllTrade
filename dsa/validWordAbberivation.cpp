#include <iostream>
using namespace std;

bool ValidWordAbbreviation(std::string word, std::string abbr) {
    int i=0;
    int j=0;
    while(j<abbr.length()){
        if(isdigit(abbr[j]))
        {
            if(abbr[j] == '0') return 0;
            int num = 0;
            while(j<abbr.length() && isdigit(abbr[j])){
                num = num * 10 + (abbr[j] - '0');
                j++;
            }
            i+=num;
        }
        else{
            if(i>word.length() || word[i] != abbr[j]) return false;
            i++;
            j++;
        }
    }
    return i == word.length() && j == abbr.length();
}
