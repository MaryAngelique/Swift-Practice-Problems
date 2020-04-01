import UIKit

//: 49. Group Anagrams

//Given an array of strings, group anagrams together.
//
//Example:
//
//Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
//Output:
//[
//  ["ate","eat","tea"],
//  ["nat","tan"],
//  ["bat"]
//]
//Note:
//
//All inputs will be in lowercase.
//The order of your output does not matter.


class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var ans = [String: [String]]()

        for s in strs {
            let sorted = String(s.sorted())
            
            var current = [String]()
            if var arr = ans[sorted] {
                arr.append(s)
                current = arr
            } else {
                current = [s]
            }
            
            ans[sorted] = current
        }
        
        return Array(ans.values)
    }
}
