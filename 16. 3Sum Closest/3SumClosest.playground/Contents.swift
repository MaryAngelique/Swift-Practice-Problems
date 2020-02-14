import UIKit

//: 16. 3Sum Closest

//Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//Example:
//
//Given array nums = [-1, 2, 1, -4], and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).


class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return 0
        }
        
        let count = nums.count
        var result = nums[0] + nums[1] + nums[count - 1]
        let nums = nums.sorted()
        var left = 0
        var right = 0
        var sum = 0
        
        for i in 0..<(count - 2) {
            left = i + 1
            right = count - 1
            while left < right {
                sum = nums[i] + nums[left] + nums[right]
                if sum > target {
                    right -= 1
                } else {
                    left += 1
                }
                if abs(sum - target) < abs(result - target) {
                    result = sum
                }
            }
        }
        
        return result
    }
}
