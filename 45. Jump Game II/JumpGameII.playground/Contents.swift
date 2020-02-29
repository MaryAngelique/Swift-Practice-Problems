import UIKit

//: 45. Jump Game II

//Given an array of non-negative integers, you are initially positioned at the first index of the array.
//
//Each element in the array represents your maximum jump length at that position.
//
//Your goal is to reach the last index in the minimum number of jumps.
//
//Example:
//
//Input: [2,3,1,1,4]
//Output: 2
//Explanation: The minimum number of jumps to reach the last index is 2.
//    Jump 1 step from index 0 to 1, then 3 steps to the last index.
//Note:
//
//You can assume that you can always reach the last index.


class Solution {
    func jump(_ nums: [Int]) -> Int {
        
        var maxPosition = 0
        var levelMax = 0
        var level = 0
        
        for i in 0..<nums.count-1 {
            maxPosition = max(maxPosition, i + nums[i]);
            if i == levelMax {
                level += 1
                levelMax = maxPosition
            }
        }
        
        return level
    }
}
