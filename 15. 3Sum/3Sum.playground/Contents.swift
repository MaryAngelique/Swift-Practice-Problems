import UIKit

//: 3Sum



//Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note:
//
//The solution set must not contain duplicate triplets.
//
//Example:
//
//Given array nums = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
//  [-1, 0, 1],
//  [-1, -1, 2]
//]

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
                
        let count = nums.count
            
        var setTriplets = Set<Triplet>()
        
        var result:[[Int]] = []
        
        for i in 0..<count  {
            
           for j in i + 1..<count {
               
               for k in j + 1..<count {
                                      
                   if nums[i] + nums[j] + nums[k] == 0 {
                       
                       let triplet = Triplet(arrayNums: [nums[i],nums[j],nums[k]])
                                              
                       if setTriplets.insert(triplet).inserted {
                           
                           result.append(triplet.arrayNums)
                           
                       }
                                              
                   }
                   
               }
               
           }

        }
                
        return result
        
    }
    
    struct Triplet: Hashable {
        
        let arrayNums: [Int]
        
        var hashValue: Int {
                                    
            return arrayNums.reduce(0) {$0 ^ $1}
        }
        
        static func == (lhs: Triplet, rhs: Triplet) -> Bool {
            
            return lhs.hashValue == rhs.hashValue
            
        }
        
    }
    
}
