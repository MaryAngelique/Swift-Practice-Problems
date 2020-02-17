import UIKit


//: 18. 4Sum

//Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
//
//Note:
//
//The solution set must not contain duplicate quadruplets.
//
//Example:
//
//Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
//
//A solution set is:
//[
//  [-1,  0, 0, 1],
//  [-2, -1, 1, 2],
//  [-2,  0, 0, 2]
//]

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var results:[[Int]] = []
    
    var i = 0
    var j = i + 1
    var k = j + 1
    var l = k + 1
    
    if nums.count < 4 {
        return results
    }
    
    
     while j <= nums.count - 3 {
        
        let sum = nums[i] + nums[j] + nums[k] + nums[l]
        if sum == target {
            var sortedArray:[Int] = []
            sortedArray.append(nums[i])
            sortedArray.append(nums[j])
            sortedArray.append(nums[k])
            sortedArray.append(nums[l])
            sortedArray.sort()
            if results.contains(sortedArray) == false {
                results.append([])
                results[results.count-1] = sortedArray
            }
        }
        l += 1
        if l > nums.count - 1 {
            k += 1
            l = k + 1
        }
        if k > nums.count - 2 {
            j += 1
            k = j + 1
            l = k + 1
        }
        if j > nums.count - 3 {
            i += 1
            j = i + 1
            k = j + 1
            l = k + 1
            
        }
        
    }
    
    print("Four sum:", results)
    return results
}
    
}
