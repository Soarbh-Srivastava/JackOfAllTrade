class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        vector<vector<int>> ans;
        int n = nums.size();

        // Step 1: sort
        sort(nums.begin(),nums.end());

        // step 2: Iterate with pivot i
        for(int i=0; i<n; i++){

            if(nums[i]>0) break;

            // skip duplicate pivot
            if(i>0 && nums[i] == nums[i-1]) continue;

            int l = i+1;
            int r = n-1;

            // step 3: two pointer search
            while(l<r){
                int sum = nums[i] + nums[l] + nums[r];

                if(sum < 0) l++;
                else if(sum>0) r--;
                else{
                    // found triplet
                    ans.push_back({nums[i],nums[l],nums[r]});

                    // skip duplicate (important)
                    while(l<r && nums[l] == nums[l+1]) l++;
                    while(l<r && nums[r] == nums[r-1]) r--;

                    l++;
                    r--;
                }
            }
        }
        return ans;
    }
};
