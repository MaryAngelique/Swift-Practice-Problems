import UIKit


//: 3. Longest Substring Without Repeating Characters

//Given a string, find the length of the longest substring without repeating characters.
//
//Example 1:
//
//Input: "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.
//Example 2:
//
//Input: "bbbbb"
//Output: 1
//Explanation: The answer is "b", with the length of 1.
//Example 3:
//
//Input: "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longestLength: Int = 0
        var i = 0
        
        var letters: [Character: Int] = [:]
        
        for (j,char) in s.enumerated() {
            if let pos = letters[char] {
                i = max(pos, i)
            }
            longestLength = max(longestLength, j - i + 1)
            letters[char] = j + 1
        }
        return longestLength
    }
}
