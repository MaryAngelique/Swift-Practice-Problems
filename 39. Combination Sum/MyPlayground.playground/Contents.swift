import UIKit

//: 39. Combination Sum

//Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
//
//The same repeated number may be chosen from candidates unlimited number of times.
//
//Note:
//
//All numbers (including target) will be positive integers.
//The solution set must not contain duplicate combinations.
//Example 1:
//
//Input: candidates = [2,3,6,7], target = 7,
//A solution set is:
//[
//  [7],
//  [2,2,3]
//]
//Example 2:
//
//Input: candidates = [2,3,5], target = 8,
//A solution set is:
//[
//  [2,2,2,2],
//  [2,3,3],
//  [3,5]
//]


class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var ans = [[Int]]()
        combinationSum(candidates, candidates.count, target, 0, 0, [Int](), &ans)
        return ans
    }
    
    func combinationSum(_ candidates: [Int], _ nOfCandidates: Int, _ target: Int, _ startIndex: Int, _ sum: Int, _ current: [Int], _ ans: inout [[Int]]) {
        if sum > target {
            return
        }
        
        if sum < target {
            for index in startIndex..<nOfCandidates {
                let value = candidates[index]
                
                var current = current
                current.append(value)
                
                combinationSum(candidates, nOfCandidates, target, index, (sum + value), current, &ans)
            }
        }
        
        if sum == target {
            ans.append(current)
        }
    }
}
