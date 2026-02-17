class Solution {
public:
    int getMaximumConsecutive(vector<int>& coins) {
        sort(coins.begin(),coins.end()); //nlogn
        int change = 0;

        for(int coin :coins){
            if(coin > change+1){
                break;
            }
            change+=coin;
        }
        return change+1;
    }
};
