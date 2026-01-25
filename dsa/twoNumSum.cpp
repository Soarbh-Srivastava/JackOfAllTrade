// class Solution {
// public:
//     vector<int> twoSum(vector<int>& nums, int target) {
//     }
// };


//time complexity  -> O(N^2)
//space complexity -> o(1)
// class Solution {
// public:
//     vector<int> twoSum(vector<int>& nums, int target) {
//         vector<int>res;
//         for(int i=0;i<nums.size()-1;i++)
//         {
//             for(int j=i+1;j<nums.size();j++)
//             {
//                 if(nums[i]+nums[j]==target)
//                 {
//                     res.push_back(i);
//                     res.push_back(j);
//                     return res;
//                 }
//             }
//         }
//         return res;
//     }
// };



time -> O(n)
space -> O(n)

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int,int> seen;
        for(int i=0;i<nums.size();i++)
        {
            int need = target-nums[i];
            if(seen.count(need))
            {
                return {seen[need],i};
            }
            seen[nums[i]] = i;
        }
        return {};
    }
};



//time-> O(nlog n)
//space ->O(1)

// class Solution {
// public:
//     vector<int> twoSum(vector<int>& nums, int target) {
//         vector<pair<int,int>> v;
//         for (int i = 0; i < nums.size(); i++) {
//             v.push_back({nums[i], i});
//         }

//         sort(v.begin(), v.end());

//         int l = 0, r = v.size() - 1;
//         while (l < r) {
//             int sum = v[l].first + v[r].first;
//             if (sum > target) r--;
//             else if (sum < target) l++;
//             else return {v[l].second, v[r].second};
//         }
//         return {};
//     }
// };