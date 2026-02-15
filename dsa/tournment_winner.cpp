#include <bits/stdc++.h>
using namespace std;

string tournamentWinner(vector<vector<string>> competitions, vector<int> results) {
    unordered_map<string,int> mp;
    string currBest = "";
    mp[currBest] = 0;
    for(int i=0;i<competitions.size();i++)
    {
        string home = competitions[i][0];
        string away = competitions[i][1];
        string winner = (results[i] == 1 ) ? home : away;
        mp[winner]+=3;
        if(mp[winner] > mp[currBest]) currBest= winner;
        
    }
    return currBest;
}



int main() {
    vector<vector<string>> competitions = {
        {"HTML","C#"},
        {"C#","Python"},
        {"Python","HTML"}
    };

    vector<int> results = {0, 0, 1};

    cout << "Winner: " << tournamentWinner(competitions, results);
    return 0;
}
