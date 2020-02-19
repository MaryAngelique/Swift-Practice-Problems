import UIKit

//: 33. Search in Rotated Sorted Array

//Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
//(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Your algorithm's runtime complexity must be in the order of O(log n).
//
//Example 1:
//
//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4
//Example 2:
//
//Input: nums = [4,5,6,7,0,1,2], target = 3
//Output: -1

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count-1
        while start <= end {
            if nums[start] == target {
                return start
            }
            if nums[end] == target {
                return end
            }

            let mid = start + (end-start)/2
            if nums[mid] == target {
                return mid
            }

            if nums[mid] > nums[start] && target > nums[start] && target < nums[mid] {
                end = mid
                continue
            }

            if nums[mid] < nums[start] && (target < nums[mid] && target < nums[start] || target > nums[mid] && target > nums[start]) {
                end = mid
                continue
            }

            start = mid + 1
        }
        return -1
    }
}
