class Solution {
public:
    vector<int> sortedSquares(vector<int>& nums) {
        int n = nums.size();
        int l = 0;
        int r = n - 1;
        int x = n - 1;
        
        vector<int> res(n);
        
        while (l <= r) {
            if (abs(nums[l]) > abs(nums[r])) {
                res[x] = nums[l] * nums[l];
                l++;
            } else {
                res[x] = nums[r] * nums[r];
                r--;
            }
            x--;
        }
        
        return res;
    }
};
