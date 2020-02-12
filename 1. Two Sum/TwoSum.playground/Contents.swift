import UIKit

//: 1. Two Sum
//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution, and you may not use the same element twice.
//
//Example:
//
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].



class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    var dictVal = [Int:Int]()
    var result = [Int]()
        for i in 0..<nums.count {
            let remaining = target - nums[i]
            let keyExists = dictVal[remaining] != nil
            if keyExists {
                 result = [dictVal[remaining]!,i]
            }
            dictVal[nums[i]] = i
        }
    return result
    }
}
