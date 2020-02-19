import UIKit

//: 34. Find First and Last Position of Element in Sorted Array

//Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//If the target is not found in the array, return [-1, -1].
//
//Example 1:
//
//Input: nums = [5,7,7,8,8,10], target = 8
//Output: [3,4]
//Example 2:
//
//Input: nums = [5,7,7,8,8,10], target = 6
//Output: [-1,-1]


class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [-1, -1]
        searchRange(nums, target, &result, 0, nums.count - 1)
        return result
    }

    func searchRange(_ nums: [Int], _ target: Int, _ result: inout [Int], _ left: Int, _ right: Int) {
        if left > right { return }
        let mid = (left + right) / 2
        if nums[mid] == target {
            if result[0] == -1 { result[0] = mid; result[1] = mid }
            else if mid > result[0] && mid > result[1]  { result[1] = mid }
            else if mid < result[1] && mid < result[0] { result[0] = mid }
        
            searchRange(nums, target, &result, left, mid - 1)
            searchRange(nums, target, &result, mid + 1, right)
        
        } else if target < nums[mid] {
            searchRange(nums, target, &result, left, mid - 1)
        } else {
            searchRange(nums, target, &result, mid + 1, right)
        }
    }
}
