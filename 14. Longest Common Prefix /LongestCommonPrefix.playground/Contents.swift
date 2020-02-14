import UIKit


//: 14. Longest Common Prefix

//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//
//Example 1:
//
//Input: ["flower","flow","flight"]
//Output: "fl"
//Example 2:
//
//Input: ["dog","racecar","car"]
//Output: ""
//Explanation: There is no common prefix among the input strings.
//Note:
//
//All given inputs are in lowercase letters a-z.


class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var result = ""
        
        guard let firstWord = strs.first, let shortestWordCount = strs.map({$0.count}).min(), shortestWordCount > 0 else {
            return result
            
        }
        
        for (index, char) in firstWord.enumerated() {
            let matchedWords = strs.filter({$0[$0.index($0.startIndex, offsetBy: index)] == char})
            if matchedWords.count == strs.count {
                result.append(char)
            } else {
                return result
            }
            if index == shortestWordCount - 1 { return result }
        }
        
        return result
    }
}
