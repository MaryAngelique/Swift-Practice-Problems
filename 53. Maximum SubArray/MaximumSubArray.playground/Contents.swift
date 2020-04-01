import UIKit

//: 53. Maximum SubArray

//Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
//
//Example:
//
//Input: [-2,1,-3,4,-1,2,1,-5,4],
//Output: 6
//Explanation: [4,-1,2,1] has the largest sum = 6.
//Follow up:
//
//If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.



class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return Int.min
        }
        var maxValue = nums[0]
        var preMax = nums[0]
        for i in 1..<nums.count {
            let value = nums[i]
            let curMax = max(preMax + value, value)
            maxValue = max(maxValue, curMax)
            preMax = curMax
        }
        return maxValue
    }
}
